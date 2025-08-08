import 'package:flutter/material.dart';

void main() {
  runApp(BasicWidget());
}

class BasicWidget extends StatelessWidget {
  const BasicWidget({super.key});
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Widget'),
        ),
        body: Center(
          child: Text('HALO'),
        )
      )
    );
  }
}