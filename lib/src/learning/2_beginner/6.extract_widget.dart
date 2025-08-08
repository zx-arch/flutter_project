import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExtractWidget());
}

class ExtractWidget extends StatelessWidget {
  const ExtractWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var faker = Faker();

    return MaterialApp(
      title: "Extract Widget",
      home: Scaffold(
        // appBar: AppBar(title: Text("Extract Widget")),
        // body: ListView(
        //   children: [
        //     ChatItem(imageUrl: "https://fastly.picsum.photos/id/965/200/300.jpg?hmac=16gh0rrQrvUF3RJa52nRdq8hylkBd-pL4Ff9kqsNRDQ", name: "Diana Green", subtitle: "Subtitle", time: "10:00 AM"),
        //     ChatItem(imageUrl: "https://fastly.picsum.photos/id/680/200/200.jpg?hmac=jlYrp1rK5RIQZTIaHkTW2llzrRXtuYJLeprOC8i40os", name: "John Doe", subtitle: "Hello, how are you?", time: "10:05 AM"),
        //     ChatItem(imageUrl: "https://fastly.picsum.photos/id/924/200/400.jpg?hmac=UjjaAFkgTxuyf8_b6HvJ5xAhIPgskG3CEYNBFXzGhKM", name: "Jane Smith", subtitle: "Let's meet tomorrow", time: "10:10 AM"),
        //     ChatItem(imageUrl: "https://fastly.picsum.photos/id/614/200/100.jpg?hmac=8ZZYrJjUQuHjyDBqpAJLLjL6xcuDyb5wwBcvlTaDvvw", name: "Alice Johnson", subtitle: "Did you receive my email?", time: "10:15 AM"),
        //     ChatItem(imageUrl: "https://fastly.picsum.photos/id/319/300/300.jpg?hmac=wxlUPNzIed7hui1p7I3INBvuJBdO-ds9QfBCLj3DYT8", name: "Bob Brown", subtitle: "Can we reschedule our meeting?", time: "10:20 AM"),
        //     ChatItem(imageUrl: "https://fastly.picsum.photos/id/995/300/200.jpg?hmac=_BG6eUNbCrysBjBJA8OEf2X7tbtfCg-p42m3zrg-iZ4", name: "Charlie White", subtitle: "Looking forward to our collaboration", time: "10:25 AM"),
        //   ],
        // ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ChatItem(
              imageUrl: "https://picsum.photos/200/300?random=$index",
              name: faker.person.name(),
              subtitle: faker.lorem.sentence(),
              time: "${index + 1} minutes ago",
            );
          },
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subtitle;
  final String time;

  const ChatItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name, maxLines: 1),
      subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: Text(time),
    );
  }
}