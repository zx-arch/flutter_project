import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/player.dart';

class Players with ChangeNotifier {
  List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  dynamic addPlayer(String name, String position, String image) async {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://flutter-app-176ab-default-rtdb.firebaseio.com/players.json");

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
            "createdAt": datetimeNow.toString(),
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
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
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }

  dynamic editPlayer(String id, String name, String position, String image) async {
    Uri url = Uri.parse(
        "https://flutter-app-176ab-default-rtdb.firebaseio.com/players/$id.json");
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Player selectPlayer =
            _allPlayer.firstWhere((element) => element.id == id);
        selectPlayer.name = name;
        selectPlayer.position = position;
        selectPlayer.imageUrl = image;
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  dynamic deletePlayer(String id) async {
    Uri url = Uri.parse(
        "https://flutter-app-176ab-default-rtdb.firebaseio.com/players/$id.json");

    try {
      final response = await http.delete(url).then(
        (response) {
          _allPlayer.removeWhere((element) => element.id == id);
          notifyListeners();
        },
      );

      if (response.statusCode < 200 && response.statusCode >= 300) {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://flutter-app-176ab-default-rtdb.firebaseio.com/players.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    dataResponse.forEach(
      (key, value) {
        DateTime dateTimeParse =
            DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
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

    notifyListeners();
  }
}