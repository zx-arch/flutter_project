// design input form
import 'package:flutter/material.dart';

main() => runApp(Latihan1());

class Latihan1 extends StatelessWidget {
  const Latihan1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Latihan1')),
        body: TextFormField(
          // obscureText: true, //ini utk form password
          maxLength: 10,
          // initialValue: 'Andy UBSED',
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            filled: true,
            fillColor: Colors.amber,
            labelText: "Username",
            hintText: 'Masukkan Username',
            helperText: "username max 10 karakter",
            prefixIcon: Icon(Icons.supervisor_account),
          )
        )
        ),
    );
  }
}