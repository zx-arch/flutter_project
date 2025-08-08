import 'package:flutter/material.dart';

void main() {
  runApp(VisibleInvisible());
}

class VisibleInvisible extends StatelessWidget {
  const VisibleInvisible({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Visible Invisible'),
        ),
        // // Hidupkan salah 1 komentar dan matikan komentar lain untuk melihat hasil

        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       width: 200,
        //       height: 40,
        //       color: Colors.green,
        //     ),
        //     Container(
        //       width: 50,
        //       height: 50,
        //       color: Colors.blue
        //     ),
        //     Container(
        //       width: 100,
        //       height: 50,
        //       color: Colors.amber,
        //     ),
        //     Container(
        //       width: 300,
        //       height: 50,
        //       color: Colors.red
        //     )
        //   ],
        // )

        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       height: 200,
        //       width: 40,
        //       color: Colors.green,
        //     ),
        //     Container(
        //       height: 50,
        //       width: 50,
        //       color: Colors.blue
        //     ),
        //     Container(
        //       height: 100,
        //       width: 50,
        //       color: Colors.amber,
        //     ),
        //     Container(
        //       height: 300,
        //       width: 50,
        //       color: Colors.red
        //     )
        //   ],
        // )

        body: Stack(
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.green,
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.blue
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.amber,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.red
            )
          ],
        )
      ),
    );
  }
}