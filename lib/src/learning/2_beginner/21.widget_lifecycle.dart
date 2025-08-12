import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetLifecycle());
}

class WidgetLifecycle extends StatelessWidget {
  const WidgetLifecycle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountPage(),
    );
  }
}

class CountPage extends StatefulWidget {
  CountPage({super.key}) {
    print('constructor');
  }

  @override
  CountPageState createState() {
    print('createState()');
    return CountPageState();
  }
}

class CountPageState extends State<CountPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('initState()');
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies()');
  }
  @override
  void didUpdateWidget(covariant CountPage oldWidget) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                _counter.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(onPressed: () {}, child: Text('Go to Other'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
