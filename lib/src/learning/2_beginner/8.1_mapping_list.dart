import 'package:flutter/material.dart';

void main() {
  runApp(const MappingListPage());
}

class MappingListPage extends StatelessWidget {
  const MappingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> myList = [
      {
        'name': 'Sandhika',
        'Age': 30,
        "favColor": ['Red', 'Green', 'Blue','Red', 'Green', 'Blue','Red', 'Green', 'Blue','Red', 'Green', 'Blue'],
      },
      {
        'name': 'Yusuf',
        'Age': 27,
        "favColor": ['Black', 'White', 'Blue'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mapping List'),
        ),
        body: ListView(
          children: myList.map((item) {
            // print(item);
            List<dynamic> myFavColor = item['favColor'];
            // return Card(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Name: ${item['name']}',
            //         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //       Text('Age: ${item['Age']}'),
            //       Text('Favorite Colors: ${item['favColor'].join(', ')}'),
            //     ],
            //   ),
            // );
            return Card(
              margin: const EdgeInsets.all(5),
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${item['name']}"),
                            Text("Age: ${item['Age']}"),
                          ],
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: myFavColor.map((color) {
                          return Container(
                            color: Colors.amber,
                            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                            padding: const EdgeInsets.all(5),
                            child: Text(color),
                          );
                        }).toList(),
                      )
                    )
                  ],
                ),
              ),
            );
          }).toList()
        ),
      ),
    );
  }
}