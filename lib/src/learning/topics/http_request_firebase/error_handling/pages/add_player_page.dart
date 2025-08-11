import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players.dart';

class AddPlayer extends StatelessWidget {
  AddPlayer({super.key});
  static const routeName = "/add-player";

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final players = Provider.of<Players>(context, listen: false);
      players.addPlayer(
        nameController.text.trim(),
        positionController.text.trim(),
        imageController.text.trim(),
      ).then(
        (response) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Berhasil ditambahkan"),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pop(context);
          }
        },
      ).catchError(
        (err) => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("TERJADI ERROR $err"),
            content: Text("Tidak dapat menambahkan player."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OKAY"),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD PLAYER"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => _submitForm(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Nama"),
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama harus diisi";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Posisi"),
                  textInputAction: TextInputAction.next,
                  controller: positionController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Posisi harus diisi";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Image URL"),
                  textInputAction: TextInputAction.done,
                  controller: imageController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Image URL harus diisi";
                    }
                    return null;
                  },
                  onEditingComplete: () => _submitForm(context),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () => _submitForm(context),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
