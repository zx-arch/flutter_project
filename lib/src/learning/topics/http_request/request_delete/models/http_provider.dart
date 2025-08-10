import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  static final Uri baseUrl = Uri.parse("https://reqres.in/api/users");

  static const Map<String, String> _headerUrl = {
    'Content-Type': 'application/json',
    'x-api-key': 'reqres-free-v1',
  };

  static Uri? requestUrl;

  Map<String, String> get headerUrl => _headerUrl;

  int get count => data.length;
  bool getData = false;

  bool isClickGetData() {
    return getData;
  }

  void connectApi(String id, BuildContext context) async {
    var requestUrl = Uri.parse("$baseUrl/$id");

    var response = await http.get(
      requestUrl,
      headers: headerUrl,
    );
    if (response.statusCode == 200) {
      _data = (json.decode(response.body))["data"];
      getData = true;
      notifyListeners();
      if (context.mounted) {
        handlingStatusCode(context, "Berhasil Get Data");
      }
    } else {
      getData = false;
      // gagal mengambil data dari server
      if (context.mounted) {
        handlingStatusCode(context, "Error: ${response.reasonPhrase}");
      }
    }
  }

  void deleteData(BuildContext context) async {
    var result = await http.delete(
      requestUrl!,
      headers: headerUrl,
    );

    if (result.statusCode == 204) {
      getData = false;
      _data = {};
      notifyListeners();

      if (context.mounted) {
        handlingStatusCode(context, "Berhasil Delete Data");
      }
    }
  }

  handlingStatusCode(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 700),
      ),
    );
  }
}
