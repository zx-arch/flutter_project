import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewPage());
}

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Container> myList = List.generate(
      20,
      (index) => Container(
        height: 50,
        width: 150,
        color: Color.fromARGB(
          255, 
          Random().nextInt(256), 
          Random().nextInt(256), 
          Random().nextInt(256)
        ),
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grid View'),
        ),
      //   body: GridView(
      //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //       maxCrossAxisExtent: 100,
      //       crossAxisSpacing: 20,
      //       mainAxisSpacing: 10,
      //     ),
      //     children: myList,
      // ),
      body: GridView.count(
          childAspectRatio: 4/3,
          crossAxisCount: 3,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          children: myList,
        ),
      ),
    );
  }
}