import 'template/drawer/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DrawerPage());
}

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 105,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.all(2)),
                  ClipOval(
                    child: Image.asset(
                      'public/img/laptop.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12), // Jarak antara logo dan teks
                  const Text(
                    'Dwi Prasetyo',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: -4),
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text(
          'Home Page',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}