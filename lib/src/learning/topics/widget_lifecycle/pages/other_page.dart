import 'package:flutter/material.dart';

import 'counter_page.dart';

class OtherPage extends StatelessWidget {
  static const routeName = '/other_page';
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            final arg = ModalRoute.of(context)?.settings.arguments;
            final counterValue = (arg is int) ? arg : 0;

            Navigator.pushReplacementNamed(
              context,
              CounterPage.routeName,
              arguments: counterValue,
            );
          },
          child: Text('Go to Counter Page')
        ),
      ),
    );
  }
}