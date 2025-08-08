import 'package:flutter/material.dart';

void main() {
  runApp(const BasicStateful());
}

class BasicStateful extends StatelessWidget {
  const BasicStateful({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NumberWidget(),
    );
  }
}

class NumberWidget extends StatefulWidget {
  const NumberWidget({super.key});

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  int _numbers = 100;

  void countNumber(separator) {
    if (separator == 'add') {
      setState(() {
        _numbers += 1;
      });
    } else if (separator == 'min') {
      setState(() {
        _numbers -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "$_numbers",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    countNumber('add');
                  },
                  child: Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    countNumber('min');
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            )
          ],
        )
    );
  }
}
