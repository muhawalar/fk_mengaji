import 'package:flutter/material.dart';
import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailDoa extends StatefulWidget {
  DetailDoa({
    super.key,
    required this.index,
  });

  int index;

  @override
  State<DetailDoa> createState() => _DetailDoaState(index: index);
}

class _DetailDoaState extends State<DetailDoa> {
  _DetailDoaState({required this.index});
  int index;
  final player = AudioPlayer();
  List imageDoa = [
    'assets/doa/1.png',
    'assets/doa/2.png',
    'assets/doa/3.png',
    'assets/doa/4.png',
    'assets/doa/5.png',
    'assets/doa/6.png',
  ];

  List sound = [
    'doa1.mp3',
    'doa2.mp3',
    'doa4.mp3',
    'doa3.mp3',
    'doa5.mp3',
    'doa6.mp3',
  ];
  @override
  int push = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        player.stop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF1d3015),
        body: ListView(
          children: [
            Image.asset(imageDoa[widget.index]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: ColorApp.white,
            child: Icon(
              Icons.volume_up,
              color: ColorApp.black,
            ),
            onPressed: () {
              if (push.isEven) {
                player.play(AssetSource(sound[index]));
                setState(() {
                  push++;
                });
              } else {
                player.stop();
                setState(() {
                  push--;
                });
              }
            }),
      ),
    );
  }
}
