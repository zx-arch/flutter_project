import 'package:flutter/material.dart';

void main() {
  runApp(Latihan9());
}

class Latihan9 extends StatelessWidget {
  const Latihan9({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Belajar Stateful",
      home: const NumberWidget(),
    );
  }
}

class NumberWidget extends StatefulWidget {
  const NumberWidget({super.key});

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  int _numbers = 1000;

  void countNumber() {
    setState(() {
      _numbers += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Belajar Stateful")),
      body: Column(
        children: [
          Text("Angka sudah sampai: $_numbers"),
          ElevatedButton(
            onPressed: () {
              countNumber();
            },
            child: Text("Tambahkan 1"),
          )
        ],
      )
    );
  }
}