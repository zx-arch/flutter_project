import 'package:flutter/material.dart';
import 'popup/delete_confirmation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DialogPage(),
    );
  }
}

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});
  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  String data = 'Belum dihapus';

  void showDeleteDialog() {
    showDialog<bool>(
      context: context,
      builder: (context) => const DeleteConfirmation(),
    ).then((result) {
      if (result == true) {
        setState(() {
          data = 'Data sudah dihapus';
        });
      } else if (result == false) {
        setState(() {
          data = 'Batal menghapus';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trigger Popup')),
      body: Center(
        child: Text(
          data,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      
      floatingActionButton: data == 'Data sudah dihapus'
        ? null : FloatingActionButton(
            onPressed: showDeleteDialog,
            child: const Icon(Icons.delete),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
