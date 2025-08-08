import 'package:flutter/material.dart';

void main() {
  runApp(ListTilePage());
}

class ListTilePage extends StatelessWidget {
  const ListTilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Tile'),
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              title: const Text('Andi'),
              subtitle: const Text(
                'Halo, apa kabar? Ini adalah pesan yang cukup panjang untuk melihat bagaimana teks ini akan terpotong jika terlalu panjang.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(
                // backgroundColor: Colors.blue,
                // child: const Icon(Icons.home, color: Colors.white),
              ),
              trailing: Text('11:00 AM'),
              onTap: () {
                // Aksi ketika ListTile ditekan
                print('Chat tapped');
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              title: const Text('Yudhi'),
              subtitle: const Text(
                'Gua lagi di jalan, nanti sampai rumah ya',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(
                // backgroundColor: Colors.blue,
                // child: const Icon(Icons.home, color: Colors.white),
              ),
              trailing: Text('11:05 AM'),
              onTap: () {
                // Aksi ketika ListTile ditekan
                print('Chat tapped');
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              title: const Text('Galon'),
              subtitle: const Text(
                'Saya pesan galon 2 biji diantar besok jam 10 pagi',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(
                // backgroundColor: Colors.blue,
                // child: const Icon(Icons.home, color: Colors.white),
              ),
              trailing: Text('13:50 AM'),
              onTap: () {
                // Aksi ketika ListTile ditekan
                print('Chat tapped');
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              title: const Text('Komang'),
              subtitle: const Text(
                'Jadi maen gak nih',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(
                // backgroundColor: Colors.blue,
                // child: const Icon(Icons.home, color: Colors.white),
              ),
              trailing: Text('08:40 AM'),
              onTap: () {
                // Aksi ketika ListTile ditekan
                print('Chat tapped');
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              title: const Text('Juminten'),
              subtitle: const Text(
                'Selamat pagi, saya dari tukang jamu, ingin menawarkan jamu',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(
                // backgroundColor: Colors.blue,
                // child: const Icon(Icons.home, color: Colors.white),
              ),
              trailing: Text('12:10 AM'),
              onTap: () {
                // Aksi ketika ListTile ditekan
                print('Chat tapped');
              },
            ),
            Divider(color: Colors.black),
          ],
        )
      )
    );
  }
}