import 'package:flutter/material.dart';
import 'package:whatsapp_copy/models/calls.dart';
import 'package:whatsapp_copy/models/chats.dart';
import 'package:whatsapp_copy/models/statuses.dart';
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
        child: Row(
          mainAxisAlignment: unReadStatus
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            if (unReadStatus) ...[
              const Text("STATUS"),
              const Icon(
                Icons.brightness_1,
                size: 8,
              ),
            ] else
              const Text("STATUS"),
          ],
        ),
      ),
    ),
    Tab(
      child: SizedBox(
        width: screenRatio,
        child: Row(
          mainAxisAlignment: unreadCall > 0
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (unreadCall > 0) ...[
              const Text("CALLS"),
              circularNotification(
                  count: unreadCall,
                  context: context,
                  backgroundColor: Colors.white,
                  textColor: Theme.of(context).primaryColor)
            ] else
              const Text("CALLS"),
          ],
        ),
      ),
    ),
  ];
}
