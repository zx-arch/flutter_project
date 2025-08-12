import 'package:flutter/material.dart';

import '../widgets/widget_counter.dart';

class CounterPage extends StatefulWidget {
  static const String routeName = '/count_page';

  CounterPage({super.key}) {
    print('constructor');
  }

  @override
  CounterPageState createState() {
    print('createState()');
    return CounterPageState();
  }
}

class CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int) {
      counter = args;
    } else {
      counter = 0;
    }
    print('Nilai telah dikembalikan seperti state terakhir');
  }

  @override
  void didUpdateWidget(covariant CounterPage oldWidget) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Lifecycle'),
      ),
      body: WidgetCounter(counter: counter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
