import 'package:flutter/material.dart';

void main() {
  runApp(const ApplicationLifecycle());
}

class ApplicationLifecycle extends StatefulWidget {
  const ApplicationLifecycle({super.key});

  @override
  State<ApplicationLifecycle> createState() => _ApplicationLifecycleState();
}

class _ApplicationLifecycleState extends State<ApplicationLifecycle> with WidgetsBindingObserver {
  int number = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);

    switch (state) {
      case AppLifecycleState.inactive:
        setState(() {
          number = 99;
        });
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        setState(() {
          number = -28;
        });
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    print(number);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Application Lifecycle'),
        ),
        body: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(fontSize: 25),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              number++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
