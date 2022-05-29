import 'package:flutter/material.dart';
import 'package:whatsapp_copy/widgets/common/circular_notification.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({Key? key, required this.chat}) : super(key: key);

  final Map chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(chat['image']),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          chat['contact_name'],
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          chat['last_message_by'] == 2
              ? Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Builder(builder: (context) {
                    if (chat['last_message_status'] == 1) {
                      return const Icon(
                        Icons.check,
                        size: 15,
                      );
                    } else if (chat['last_message_status'] == 2) {
                      return const Icon(
                        Icons.done_all,
                        size: 15,
                      );
                    } else if (chat['last_message_status'] == 3) {
                      return const Icon(
                        Icons.done_all,
                        size: 15,
                        color: Colors.blue,
                      );
                    } else {
                      return const Icon(
                        Icons.access_time_outlined,
                        size: 15,
                      );
                    }
                  }),
                )
              : const Padding(
                  padding: EdgeInsets.only(right: 2),
                ),
          if (chat['last_message_type'] == 1) ...[
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Text(
                chat['last_message'],
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            )
          ] else if (chat['last_message_type'] == 2) ...[
            const Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.photo,
                size: 15,
              ),
            ),
            const Text(
              "Photo",
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ] else if (chat['last_message_type'] == 3) ...[
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Icon(
                Icons.mic,
                size: 15,
                color: chat['last_message_status'] == 3
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
            Text(
              chat['last_message'],
              style: const TextStyle(
                fontSize: 12,
              ),
            )
          ] else if (chat['last_message_type'] == 4) ...[
            const Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.photo,
                size: 15,
              ),
            ),
            Text(
              chat['last_message'],
              style: const TextStyle(
                fontSize: 12,
              ),
            )
          ]
        ],
      ),
      trailing: chat['un_read_msg_count'] > 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat['date_time'],
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
                circularNotification(
                    count: chat['un_read_msg_count'], context: context)
              ],
            )
          : Text(chat['date_time']),
    );
  }
}
