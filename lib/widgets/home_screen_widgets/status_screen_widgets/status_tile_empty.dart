import 'package:flutter/material.dart';
import 'package:whatsapp_copy/models/user.dart';

class StatusTileEmpty extends StatelessWidget {
  const StatusTileEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(userProfile['profile_pic']),
          ),
          Positioned(
            child: Material(
              color: Colors.white,
              shape: const CircleBorder(
                side: BorderSide(color: Colors.white, width: 2),
              ),
              child: Icon(
                Icons.add_circle,
                color: Theme.of(context).primaryColorLight,
                size: 25,
              ),
            ),
          )
        ],
      ),
      title: const Text(
        "My status",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text("Tap to add status update"),
    );
  }
}
