import 'package:flutter/material.dart';

void main() {
  runApp(MainRouting());
}

class MainRouting extends StatelessWidget {
  const MainRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      // initialRoute: '/login',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/setting': (context) => Setting(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Text('Ini halaman home'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            }, child: const Text('Go To Setting'))
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          Text('Ini halaman login'),
        ],
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        automaticallyImplyLeading: false, 
      ),
      body: Column(
        children: [
          Text('Ini halaman setting'),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Kembali ke home')),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}