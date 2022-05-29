import 'package:flutter/material.dart';
import 'package:whatsapp_copy/models/chats.dart';
import 'package:whatsapp_copy/widgets/common/circular_notification.dart';

homeTabBarList(screenRatio, BuildContext context) {
  return [
    Tab(
      child: SizedBox(
        width: screenRatio / 3,
        child: const Icon(Icons.camera_alt_rounded),
      ),
    ),
    Tab(
      child: SizedBox(
        width: screenRatio,
        child: Row(
          mainAxisAlignment: unreadChat > 0
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (unreadChat > 0) ...[
              const Text("CHATS"),
              circularNotification(
                  count: unreadChat,
                  context: context,
                  backgroundColor: Colors.white,
                  textColor: Theme.of(context).primaryColor)
            ] else
              const Text("CHATS"),
          ],
        ),
      ),
    ),
    Tab(
      child: SizedBox(
        width: screenRatio,
        child: const Center(
          child: Text("STATUS"),
        ),
      ),
    ),
    Tab(
      child: SizedBox(
        width: screenRatio,
        child: const Center(
          child: Text("CALLS"),
        ),
      ),
    ),
  ];
}
