import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Test saja untuk pindah halaman',
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Column(
        children: [
          Text('Ini adalah Page 1'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => Page2())
              );
            },
            child: Text('Pindah ke Page 2'),
          )
        ],
      )
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Column(
        children: [
          Text('Ini adalah Page 2'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Pindah ke Page 1'),
          )
        ],
      )
    );
  }
}