import 'package:flutter/material.dart';
import 'package:whatsapp_copy/models/chats.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/chat_screen_widgets/message_tile.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myChats.length,
        itemBuilder: (BuildContext context, int index) {
          return MessageTile(
            chat: myChats[index],
          );
        });
  }
}
