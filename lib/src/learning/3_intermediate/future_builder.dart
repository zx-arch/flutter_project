import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(FutureBuilderExample());
}

class FutureBuilderExample extends StatelessWidget {
  const FutureBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<Map<String, dynamic>> ambilData() async {
    try {
      var requestUrl = Uri.parse("https://reqres.in/api/users/2");

      var response = await http.get(
        requestUrl,
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'reqres-free-v1',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'] as Map<String, dynamic>;
        return data;
      } else {
        throw ("${response.statusCode} Failed to load data");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Builder'),
      ),
      body: FutureBuilder(
        future: ambilData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data kosong'));
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                snapshot.connectionState == ConnectionState.done ? "${snapshot.data!['first_name'].toString()} ${snapshot.data!['last_name'].toString()}" : 'Nama',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ambilData();
        },
        child: Icon(Icons.sync_outlined),
      ),
    );
  }
}
