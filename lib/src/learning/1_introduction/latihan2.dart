// styling button login
import 'package:flutter/material.dart';

main() => runApp(Latihan2());

class Latihan2 extends StatelessWidget {
  const Latihan2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Latihan 2')),
        // body: ElevatedButton(
        //   onPressed: () {
        //     print('Button Clicked');
        //   },
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.blue[100], // background color
        //   ),
        //   child: Text('Login', style: TextStyle(
        //     color: Color.fromARGB(197, 50, 46, 163)
        //   ),)
        //   )
        body: Container(
          width: 300,
          height: 40,
          // child: ElevatedButton(
          //   onPressed: () {
          //     print('Button Clicked');
          //   }, 
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blue[100], 
          //     shape: RoundedRectangleBorder(
          //         // borderRadius: BorderRadius.zero,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //   ),
          //   child: Text('Login', style: TextStyle(
          //     color: Color.fromARGB(197, 50, 46, 163)
          //   ))
          // ),

          child: ElevatedButton.icon(
            onPressed: () {
              print('Button Clicked');
            }, 
            icon: Icon(Icons.add_a_photo),
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: Colors.blue[100],
            // ),
            label: Text('Ambil Foto')
          )
        )
      )
    );
  }
}