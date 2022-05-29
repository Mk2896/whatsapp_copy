import 'package:flutter/material.dart';
import 'package:whatsapp_copy/global_constants/theme_color.dart';
import 'package:whatsapp_copy/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Replica',
      theme: ThemeData(
        primarySwatch: colorTheme,
      ),
      home: const HomePage(),
    );
  }
}
