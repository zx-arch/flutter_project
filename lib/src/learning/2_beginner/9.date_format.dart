import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const DateFormatPage());
}

class DateFormatPage extends StatelessWidget {
  const DateFormatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Date Format'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Current Date and Time: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}'),
              Text('Formatted Date: ${DateFormat('EEEE, d MMMM yyyy').format(DateTime.now())}'),
            ],
          ),
        ),
      ),
    );
  }
}