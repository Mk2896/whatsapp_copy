import 'package:flutter/material.dart';
import 'package:whatsapp_copy/widgets/common/circular_notification.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/call_screen_widgets/call_date.dart';

class CallTile extends StatelessWidget {
  const CallTile({Key? key, required this.call}) : super(key: key);

  final Map call;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(call['image']),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          call['contact_name'],
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (call['call_sub_type'] == 1)
            Icon(
              Icons.call_received,
              color: Theme.of(context).primaryColorLight,
              size: 15,
            )
          else if (call['call_sub_type'] == 2)
            const Icon(
              Icons.call_received,
              color: Colors.red,
              size: 15,
            )
          else
            Icon(
              Icons.call_made,
              color: Theme.of(context).primaryColorLight,
              size: 15,
            ),
          const Padding(padding: EdgeInsets.only(right: 5)),
          Text(
            callDate(call['date']),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          call['call_type'] == 1
              ? Icon(
                  Icons.phone,
                  color: Theme.of(context).primaryColorLight,
                )
              : Icon(
                  Icons.videocam,
                  color: Theme.of(context).primaryColorLight,
                ),
        ],
      ),
    );
  }
}
