import 'package:flutter/material.dart';

void main() {
  runApp(const ThemesExample());
}

class ThemesExample extends StatelessWidget {
  const ThemesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: buildAppTheme(),
    );
  }
}

ThemeData buildAppTheme() {
  return ThemeData(
    visualDensity: VisualDensity.comfortable,
    scaffoldBackgroundColor: Colors.deepPurpleAccent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    // colorScheme: ColorScheme.fromSwatch(
    //       primarySwatch: Colors.red,
    //       accentColor: Colors.amber,
    //       brightness: Brightness.light,
    //     ),
    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // Navigation Bar
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.blueGrey.shade100,
      indicatorColor: Colors.amber.shade200,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(color: Colors.black87),
      ),
    ),

    // Bottom AppBar
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.blueGrey,
      shape: CircularNotchedRectangle(),
    ),

    // Badge
    badgeTheme: const BadgeThemeData(
      backgroundColor: Colors.red,
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // Text Styles
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      labelSmall: TextStyle(fontSize: 12, color: Colors.grey),
    ),

    // Buttons
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: Colors.blue,
    //     foregroundColor: Colors.white,
    //     textStyle: const TextStyle(fontSize: 18),
    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    //   ),
    // ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),

    // iconTheme: const IconThemeData(color: Colors.black87),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Themes Example'),
        actions: [
          Transform.translate(
            offset: const Offset(-4, 0), // Geser ke kiri
            child: Badge(
              label: const Text('3'),
              offset: const Offset(-2, 0), // Posisi badge relatif ke icon
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ),
          ),

        ],
      ),

      body: Column(
        children: [
          // // Navigation bar di atas
          // Container(
          //   height: 60,
          //   color: Colors.blueGrey.shade100,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: const [
          //       Icon(Icons.home),
          //       Icon(Icons.search),
          //       Icon(Icons.person),
          //     ],
          //   ),
          // ),

          // Konten utama di tengah
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hello, World!', style: textTheme.titleLarge),
                  const SizedBox(height: 20),
                  Text('This is a themed text.', style: textTheme.bodyLarge),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home),
            Icon(Icons.person),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.question_answer_rounded),
      ),
    );
  }
}
