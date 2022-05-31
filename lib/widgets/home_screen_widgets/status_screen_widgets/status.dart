import 'package:flutter/material.dart';
import 'package:whatsapp_copy/models/statuses.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/status_screen_widgets/status_tile.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/status_screen_widgets/status_tile_empty.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myStatuses.isNotEmpty
              ? StatusTile(
                  status: myStatuses,
                  title: "My status",
                  hasOption: true,
                )
              : const StatusTileEmpty(),
          // Recent Updates
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 5, top: 5),
            child: Text(
              "Recent updates",
              style: TextStyle(fontSize: 15, color: Colors.blueGrey),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recentStatuses.length,
              itemBuilder: (context, index) {
                return StatusTile(
                  status: recentStatuses[index],
                  title: recentStatuses[index]['title'],
                );
              }),
          //Viewed Updates
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 5, top: 5),
            child: Text(
              "Viewed updates",
              style: TextStyle(fontSize: 15, color: Colors.blueGrey),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewedStatuses.length,
              itemBuilder: (context, index) {
                return StatusTile(
                  status: viewedStatuses[index],
                  title: viewedStatuses[index]['title'],
                );
              }),
          // Muted Updates
          mutedStatuses.isNotEmpty
              ? Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: const Text(
                      'Muted updates',
                      style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                    ),
                    collapsedIconColor: Theme.of(context).primaryColorLight,
                    iconColor: Theme.of(context).primaryColorLight,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: mutedStatuses.length,
                          itemBuilder: (context, index) {
                            return StatusTile(
                              status: mutedStatuses[index],
                              title: mutedStatuses[index]["title"],
                              muted: true,
                            );
                          }),
                    ],
                  ),
                )
              : const Padding(padding: EdgeInsets.zero),
        ],
      ),
    );
  }
}
