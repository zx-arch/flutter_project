import 'package:flutter/material.dart';
import '../models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("POST - PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, dataProvider, child) => Text(
                  dataProvider.data['id'] == null ? 'Belum ada data' : dataProvider.data['id'].toString(),
                  style: TextStyle(fontSize: 20),
                )
              )
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, dataProvider, child) => Text(
                dataProvider.data['name'] ?? 'Belum ada data',
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, dataProvider, child) => Text(
                dataProvider.data['job'] ?? 'Belum ada data',
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
            ),
            SizedBox(height: 20),
            FittedBox(
                child: Text("Created At : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, dataProvider, child) => Text(
                  dataProvider.data['createdAt'] ?? 'Belum ada data',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                dataProvider.connectApi('Bejo Sutedjo', 'Programmer');
              },
              child: Text(
                "POST DATA",
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