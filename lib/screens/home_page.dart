import 'package:flutter/material.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/HomeTabbarsList.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/call_screen_widgets/calls.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/camera.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/chat_screen_widgets/chats.dart';
import 'package:whatsapp_copy/widgets/home_screen_widgets/status.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalScreenWidth = MediaQuery.of(context).size.width.roundToDouble();
    double screenRatio = (totalScreenWidth / 7).roundToDouble();
    screenRatio = screenRatio + screenRatio / 3;

    return DefaultTabController(
      length: 4,
      animationDuration: Duration(milliseconds: 240),
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Whatsapp'),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: homeTabBarList(screenRatio, context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              if (DefaultTabController.of(context)?.index == 1) {
                return const [
                  PopupMenuItem(
                    child: Text('New group'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  PopupMenuItem(
                    child: Text('New broadcast'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  PopupMenuItem(
                    child: Text('Linked devices'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  PopupMenuItem(
                    child: Text('Starred messages'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  PopupMenuItem(
                    child: Text('Settings'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ];
              } else if (DefaultTabController.of(context)?.index == 2) {
                return const [
                  PopupMenuItem(
                    child: Text('Status Privacy'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  PopupMenuItem(
                    child: Text('Settings'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ];
              } else if (DefaultTabController.of(context)?.index == 3) {
                return const [
                  PopupMenuItem(
                    child: Text('Clear Call Log'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  PopupMenuItem(
                    child: Text('Settings'),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ];
              } else {
                return [];
              }
            })
          ],
        ),
        body: const TabBarView(
          children: [Camera(), Chats(), Status(), Calls()],
        ),
      ),
    );
  }
}
