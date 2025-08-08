import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DismissiblePage(),
    );
  }
}

class DismissiblePage extends StatefulWidget {
  const DismissiblePage({super.key});

  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  final faker = Faker();

  late List<Map<String, String>> items = List.generate(
      100,
      (index) => {
        'id': index.toString(),
        'name': faker.person.name(),
        'sentence': faker.lorem.sentence(),
      },
    );

  String getInitials(String name) {
    List<String> parts = name.trim().split(' ');
    if (parts.length == 1) {
      return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : '';
    } else {
      return (parts[0][0] + (parts.length > 1 ? parts[1][0] : '')).toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final name = item['name']!;
          final sentence = item['sentence']!;

          return Dismissible(
            key: Key(item['id']!), // Gunakan ID unik
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) {
              return showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Confirm'),
                    content: Text('Are you sure you want to delete $name?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              final deletedName = name; // Simpan nama sebelum menghapus
              setState(() {
                items.removeAt(index); // Hapus item dari daftar
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$deletedName has been deleted'),
                  duration: const Duration(seconds: 5),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: Card(
              elevation: 1.5,
              child: ListTile(
                title: Text(name),
                subtitle: Text(sentence),
                leading: CircleAvatar(
                  child: Text(getInitials(name)),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}