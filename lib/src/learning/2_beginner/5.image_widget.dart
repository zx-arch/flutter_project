import 'package:flutter/material.dart';

void main() {
  runApp(const ImageWidget());
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Widget'),
        ),
        body: Center(
          child: Container(
            width: 250,
            height: 400,
            color: Colors.amber,
            child: Image.network(
              'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80',
              fit: BoxFit.cover,
            ),
            // child: Image(
            //   fit: BoxFit.cover,
            //   image: AssetImage('public/img/laptop.jpg'),
            //   // image: NetworkImage(
            //   //   'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80',
            //   // ),
            // ),
          ),
        ),
      ),
    );
  }
}