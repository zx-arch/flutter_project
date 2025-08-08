import 'package:flutter/material.dart';

main() => runApp(Latihan6());

class Latihan6 extends StatelessWidget {
  const Latihan6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan 6'),
        ),
        body: Column(
          children: [
            Text('Form Login'),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Masukkan Username Anda'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Masukkan Password Anda'
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {}, 
              child: Text('Submit')
            )
          ],
        )
      ),
    );
  }
}