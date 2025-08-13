import 'package:flutter/material.dart';

import '../pages/other_page.dart';

class WidgetCounter extends StatefulWidget {
  final int counter;

  WidgetCounter({super.key, required this.counter}) {
    print('constructor WidgetCounter');
  }

  @override
  WidgetCounterState createState() {
    print('createState WidgetCounter');
    return WidgetCounterState();
  }
}

class WidgetCounterState extends State<WidgetCounter> {
  @override
  void initState() {
    super.initState();
    print('initState WidgetCounter');
  }

  @override
  void dispose() {
    print('dispose WidgetCounter');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies CounterPage');
    // Jangan reset counter di sini kalau tidak perlu
  }

  @override
  void didUpdateWidget(covariant WidgetCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("old: ${oldWidget.counter}");
    print('didUpdateWidget CounterPage');
    print("new: ${widget.counter}");
  }

  @override
  Widget build(BuildContext context) {
    print('build WidgetCounter');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.counter.toString(),
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              // Pakai push biasa, bukan pushReplacement
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OtherPage()),
              );
            },
            child: const Text('Go to Other'),
          ),
        ],
      ),
    );
  }
}