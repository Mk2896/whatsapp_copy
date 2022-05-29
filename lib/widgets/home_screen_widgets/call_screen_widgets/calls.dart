import 'package:flutter/material.dart';
import 'package:whatsapp_copy/models/calls.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/call_screen_widgets/call_tile.dart';

class Calls extends StatelessWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myCalls.length,
        itemBuilder: (BuildContext context, int index) {
          return CallTile(
            call: myCalls[index],
          );
        });
  }
}
