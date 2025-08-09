import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get count => _data.length;

  connectApi(String name, String job) async {
    var url = Uri.parse('https://reqres.in/api/users');

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
      body: '{"name": "$name", "job": "$job"}',
    );

    _data = json.decode(response.body);

    notifyListeners();
  }
}