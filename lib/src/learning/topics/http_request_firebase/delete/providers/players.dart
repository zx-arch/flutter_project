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

  void editPlayer(String id, String name, String position, String image, BuildContext context) {
      Player selectPlayer = _allPlayer.firstWhere((element) => element.id == id);
      selectPlayer.name = name;
      selectPlayer.position = position;
      selectPlayer.imageUrl = image;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Berhasil diubah"),
          duration: Duration(seconds: 2),
        ),
      );
      notifyListeners();
  }

  Future<void> deletePlayer(String id) {
    Uri url =Uri.parse("https://flutter-app-176ab-default-rtdb.firebaseio.com/players/$id.json");
    return http.delete(url).then((response) {
      _allPlayer.removeWhere((element) => element.id == id);
      notifyListeners();
    });
  }
}