import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class HttpStateful {
  static const routeName = '/home_api';
  String? id, name, job, createdAt;

  HttpStateful({this.id, this.name, this.job, this.createdAt});

  static Future<HttpStateful> connectApi(String name, String job) async {
    var url = Uri.parse('https://reqres.in/api/users');

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
      body: '{"name": "$name", "job": "$job"}',
    );

    var data = json.decode(response.body);

    log(jsonEncode(data), name: 'API Response');

    return HttpStateful(
      id: data['id'].toString(),
      name: data['name'],
      job: data['job'],
      createdAt: data['createdAt'],
    );
  }

}
