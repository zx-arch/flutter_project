import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/player.dart';

class Players with ChangeNotifier {
  final List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  Future<void> addPlayer(String name, String position, String image) {
    DateTime datetimeNow = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(datetimeNow);

    Uri url = Uri.parse(
        "https://flutter-app-176ab-default-rtdb.firebaseio.com/players.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "name": name,
          "position": position,
          "imageUrl": image,
          "createdAt": formattedDate,
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _allPlayer.add(
          Player(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            position: position,
            imageUrl: image,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editPlayer(String id, String name, String position, String image) {
    Uri url = Uri.parse("https://flutter-app-176ab-default-rtdb.firebaseio.com/players/$id.json");
    return http.put(
      url,
      body: json.encode(
        {
          "name": name,
          "position": position,
          "imageUrl": image,
        },
      ),
    ).then((response) {
      Player selectPlayer =
            _allPlayer.firstWhere((element) => element.id == id);
        selectPlayer.name = name;
        selectPlayer.position = position;
        selectPlayer.imageUrl = image;
      notifyListeners();
    });
  }

  Future<void> deletePlayer(String id) {
    Uri url =Uri.parse("https://flutter-app-176ab-default-rtdb.firebaseio.com/players/$id.json");
    return http.delete(url).then((response) {
      _allPlayer.removeWhere((element) => element.id == id);
      notifyListeners();
    });
  }

Future<void> initialData() async {
  Uri url = Uri.parse(
      "https://flutter-app-176ab-default-rtdb.firebaseio.com/players.json");

  var hasilGetData = await http.get(url);

  if (hasilGetData.body == "null") {
    _allPlayer.clear(); // kalau belum ada data, pastikan list kosong
    notifyListeners();
    return;
  }

  var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

  _allPlayer.clear(); // clear biar tidak dobel

  dataResponse.forEach(
    (key, value) {
      DateTime dateTimeParse =
          DateFormat("yyyy-MM-dd HH:mm:ss").parse(value["createdAt"]);
      _allPlayer.add(
        Player(
          id: key,
          createdAt: dateTimeParse,
          imageUrl: value["imageUrl"],
          name: value["name"],
          position: value["position"],
        ),
      );
    },
  );

  print("BERHASIL MASUKKAN DATA LIST");
  notifyListeners();
}

}