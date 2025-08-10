import 'dart:math';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/http_provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("GET - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Consumer<HttpProvider>(
                builder: (context, dataProvider, value) => Container(
                height: 100,
                width: 100,
                child: Image.network(
                  dataProvider.data['avatar'] ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                  fit: BoxFit.cover,
                ),
              ))
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, dataProvider, value) => Text(
                "ID : ${dataProvider.data['id'] ?? 'Belum ada data'}",
                style: TextStyle(fontSize: 20),
              ))
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, dataProvider, value) {
                  final firstName = dataProvider.data['first_name'];
                  final lastName = dataProvider.data['last_name'];

                  return Text(
                    (firstName != null && firstName.isNotEmpty && lastName != null && lastName.isNotEmpty)
                        ? "$firstName $lastName"
                        : (firstName != null && lastName == null ? firstName : lastName ?? 'Belum ada data'),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  );
                },
              )
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, dataProvider, value) => Text(
                dataProvider.data['email'] ?? 'Belum ada data',
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                dataProvider.connectApi((1 + Random().nextInt(10)).toString());
              },
              child: Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}