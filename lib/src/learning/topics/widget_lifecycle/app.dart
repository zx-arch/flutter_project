import 'package:flutter/material.dart';

import 'pages/counter_page.dart';
import 'pages/other_page.dart';

void main() {
  runApp(const WidgetLifecycle());
}

class WidgetLifecycle extends StatelessWidget {
  const WidgetLifecycle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
      routes: {
        CounterPage.routeName: (context) => CounterPage(),
        OtherPage.routeName: (context) => const OtherPage(),
      },
    );
  }
}