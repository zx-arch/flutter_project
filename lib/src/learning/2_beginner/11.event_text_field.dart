import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  EventTextFieldState createState() => EventTextFieldState();
}

class EventTextFieldState extends State<MyApp> {
  final TextEditingController controller = TextEditingController();
  String result = 'Hasil Output:';
  String? errorText;

  // Validasi username secara manual
  bool validateUsername(String username) {
    if (username.isEmpty) {
      errorText = 'Username tidak boleh kosong';
      return false;
    } else if (username.length < 3) {
      errorText = 'Minimal 3 karakter';
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9_.-@*&+]+$').hasMatch(username)) {
      errorText = 'Username tidak valid';
      return false;
    }
    errorText = null;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Event Text Field')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                    errorText: errorText,
                  ),
                  onChanged: (value) {
                    setState(() {
                      validateUsername(value);
                      result = 'Hasil Output:';
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final username = controller.text;
                    if (validateUsername(username)) {
                      setState(() {
                        result = 'Hasil Output: $username';
                      });
                    } else {
                      setState(() {}); // untuk memunculkan errorText
                    }
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 16),
                Text(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
