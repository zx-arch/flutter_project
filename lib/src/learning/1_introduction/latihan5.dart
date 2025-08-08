import 'package:flutter/material.dart';

main() => runApp(Latihan5());

class Latihan5 extends StatelessWidget {
  const Latihan5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan 5'),
        ),
        // body: Row(
        //   children: [
        //     Text('Label 1'),
        //     Text('Label 2'),
        //     Text('Label 3')
        //   ],
        // )
        body: Column(
          children: [
            Text('Label 1'),
            Text('Label 2'),
            Text('Label 3')
          ],
        )
      ),
    );
  }
}