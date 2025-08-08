import 'package:flutter/material.dart';

void main() {
  runApp(ListViewPage());
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Color> myColor = [
    //   Colors.red,
    //   Colors.green,
    //   Colors.blue,
    //   Colors.amber,
    // ];

    List <Widget> myList = List.generate(
      100,
      (index) => Text(
        "${index + 1}",
        style: TextStyle(
          fontSize: 20 + double.parse(index.toString()),
        ),
      )
    );

    return MaterialApp( 
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List View'),
        ),
        body: ListView(
          children: myList,
        )
      )
    );
  }
}

