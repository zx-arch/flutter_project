import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players.dart';

class DetailPlayer extends StatelessWidget {
  const DetailPlayer({super.key});
  static const routeName = "/detail-player";

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Players>(context, listen: false);
    final playerId = ModalRoute.of(context)?.settings.arguments as String;
    final selectPLayer = players.selectById(playerId);
    final TextEditingController imageController =
        TextEditingController(text: selectPLayer.imageUrl);
    final TextEditingController nameController =
        TextEditingController(text: selectPLayer.name);
    final TextEditingController positionController =
        TextEditingController(text: selectPLayer.position);
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAIL PLAYER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  imageController.text,
                ),
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Posisi"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  players.editPlayer(
                    playerId,
                    nameController.text,
                    positionController.text,
                    imageController.text,
                    context,
                  );
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    players.editPlayer(
                      playerId,
                      nameController.text,
                      positionController.text,
                      imageController.text,
                      context,
                    );
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
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