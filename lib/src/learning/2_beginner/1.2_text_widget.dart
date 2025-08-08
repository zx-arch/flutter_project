import 'package:flutter/material.dart';

void main() {
  runApp(TextWidget());
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Widget'),
        ),
        body: Center(
          child: Text(
            'HALLOadgadqwgbdgwbdgvwgdvwfdshfsdhfdsjfhdsjfjfgagfasbjdfsfaqrpfdwqvdgvwgriouqwrruwr434snjdhfdufdsuhfdvwgdfvewgqdvgvqgwvd',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.amber,
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
              fontFamily: 'Comfortaa',
              decorationStyle: TextDecorationStyle.wavy,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white,
              decorationThickness: 2
            ),
          ),
        )
      )
    );
  }
}