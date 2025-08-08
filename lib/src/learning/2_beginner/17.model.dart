import 'template/model/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ModelPage());
}

class ModelPage extends StatelessWidget {
  const ModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}