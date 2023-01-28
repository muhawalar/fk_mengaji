import 'package:flutter/material.dart';
import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';

class DetailSurah extends StatelessWidget {
  DetailSurah({
    super.key,
    required this.namaSurah,
    required this.index,
  });

  String namaSurah;
  int index;

  List ayat = [
    'assets/surah/an-naas.png',
    'assets/surah/al-falaq.png',
    'assets/surah/al-Ikhlas.png',
    'assets/surah/al-lahab.png',
    'assets/surah/an-nasr.png',
    'assets/surah/al-kafirun.png',
    'assets/surah/al-kausar.png',
    'assets/surah/al-maun.png',
    'assets/surah/quraisy.png',
    'assets/surah/quraisy.png',
    'assets/surah/al-fil.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1d3015),
      body: ListView(
        children: [
          Image.asset(ayat[index]),
        ],
      ),
    );
  }
}
