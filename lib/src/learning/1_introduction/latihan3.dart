import 'package:flutter/material.dart';

main() => runApp(Latihan3());

class Latihan3 extends StatelessWidget {
  const Latihan3({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Latihan 3')),
        body: Center(
          child: Text('Belajar menggunakan center'),
        )
      )
    );
  }
}