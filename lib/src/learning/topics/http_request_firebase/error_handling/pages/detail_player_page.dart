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
    final selectPlayer = players.selectById(playerId);

    final TextEditingController imageController =
        TextEditingController(text: selectPlayer.imageUrl);
    final TextEditingController nameController =
        TextEditingController(text: selectPlayer.name);
    final TextEditingController positionController =
        TextEditingController(text: selectPlayer.position);

    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAIL PLAYER"),
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
                const SizedBox(height: 25),
                TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: "Nama"),
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Posisi"),
                  textInputAction: TextInputAction.next,
                  controller: positionController,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Image URL"),
                  textInputAction: TextInputAction.done,
                  controller: imageController,
                  onEditingComplete: () {
                    players.editPlayer(
                      playerId,
                      nameController.text,
                      positionController.text,
                      imageController.text,
                    ).then((value) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil diubah"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    });
                  },
                ),
                const SizedBox(height: 25),
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
                      ).then((value) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Berhasil diubah"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                          }
                      });
                    },
                    child: const Text(
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
