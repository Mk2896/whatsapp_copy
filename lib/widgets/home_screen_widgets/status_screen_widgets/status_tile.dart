import 'package:flutter/material.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/status_screen_widgets/status_avatar.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/status_screen_widgets/status_date.dart';

class StatusTile extends StatelessWidget {
  const StatusTile(
      {Key? key,
      required this.status,
      required this.title,
      this.hasOption = false,
      this.muted = false})
      : super(key: key);
  final Map status;
  final String title;
  final bool hasOption;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: muted ? 0.5 : 1,
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 58,
              height: 60,
              child: CustomPaint(
                painter: StatusAvatar(
                    numberOfStories: status['total_statuses'],
                    numberOfSeenStories: status['seen_statuses'],
                    seenColor: Colors.grey,
                    unseenColor: Theme.of(context).primaryColorLight),
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(status['latest_status']),
            ),
          ],
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(statusDate(status['date'])),
        trailing: hasOption
            ? IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).primaryColorLight,
                ),
                onPressed: () {},
              )
            : null,
      ),
    );
  }
}
