import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get count => data.length;

  connectApi(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");
    var response = await http.get(
      url, 
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      }
    );
    _data = json.decode(response.body)['data'];
    notifyListeners();
  }
}