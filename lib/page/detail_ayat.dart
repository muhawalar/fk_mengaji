import 'package:flutter/material.dart';
import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailSurah extends StatefulWidget {
  DetailSurah({
    super.key,
    required this.index,
  });

  int index;

  @override
  State<DetailSurah> createState() => _DetailSurahState(index: index);
}

class _DetailSurahState extends State<DetailSurah> {
  _DetailSurahState({required this.index});
  int index;
  final player = AudioPlayer();
  List ayat = [
    'assets/surah/al-fil.png',
    'assets/surah/quraisy.png',
    'assets/surah/al-maun.png',
    'assets/surah/al-kausar.png',
    'assets/surah/al-kafirun.png',
    'assets/surah/an-nasr.png',
    'assets/surah/al-lahab.png',
    'assets/surah/al-ikhlas.png',
    'assets/surah/al-falaq.png',
    'assets/surah/an-naas.png',
  ];

  List sound = [
    '1.mp3',
    '2.mp3',
    '3.mp3',
    '4.mp3',
    '5.mp3',
    '6.mp3',
    '7.mp3',
    '8.mp3',
    '9.mp3',
    '10.mp3',
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
            Image.asset(ayat[widget.index]),
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
