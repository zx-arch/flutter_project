import 'package:flutter/material.dart';

main() => runApp(Latihan4());

class Latihan4 extends StatelessWidget {
  const Latihan4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan 4'),
        ),
        body: Container (
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border(
              bottom: BorderSide(width: 2, color: Colors.black),
              left: BorderSide(width: 2, color: Colors.black),
              right: BorderSide(width: 2, color: Colors.black),
              top: BorderSide(width: 2, color: Colors.black),
            )
          ),
          height: double.infinity,
          width: double.infinity,
          child: Center(child: Text('Belajar Container')),
        )
      )
    );
  }
} 