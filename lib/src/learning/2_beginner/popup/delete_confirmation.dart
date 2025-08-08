import 'package:flutter/material.dart';

class DeleteConfirmation extends StatelessWidget {
  const DeleteConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: const Text('Are you sure you want to delete this item?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true); // YES
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(false); // NO
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
