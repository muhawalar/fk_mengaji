import 'package:fk_mengaji/page/detail_video.dart';
import 'package:fk_mengaji/page/list_video_hijaiyah.dart';
import 'package:fk_mengaji/page/homepage.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:fk_mengaji/splash_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
