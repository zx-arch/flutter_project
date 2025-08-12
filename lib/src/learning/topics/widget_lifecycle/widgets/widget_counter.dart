import 'package:flutter/material.dart';

import '../pages/other_page.dart';

class WidgetCounter extends StatefulWidget {
  final int counter;

  WidgetCounter({super.key, required this.counter}) {
    print('constructor widget');
  }

  @override
  WidgetCounterState createState() {
    print('createState()');
    return WidgetCounterState();
  }
}

class WidgetCounterState extends State<WidgetCounter> {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant WidgetCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget()');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate()');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose()');
  }

  @override
  Widget build(BuildContext context) {
    print('build()');
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
              Navigator.pushNamed(context, OtherPage.routeName);
            },
            child: const Text('Go to Other'),
          ),
        ],
      ),
    );
  }
}
