import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpStateful {
  String? id, email, fullname, avatar;

  HttpStateful({
    this.id,
    this.email,
    this.fullname,
    this.avatar,
  });

  static Future<HttpStateful> connectApi(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");
    var response = await http.get(
      url, 
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      }
    );
    var result = json.decode(response.body)['data'];
    return HttpStateful(
      id: result['id'].toString(),
      email: result['email'],
      fullname: result['first_name'] + " ${result['last_name']}",
      avatar: result['avatar'],
    );
  }
}