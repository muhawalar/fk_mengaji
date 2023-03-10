import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fk_mengaji/material/themes_font.dart';

class VideoPlayerTajwid extends StatefulWidget {
  VideoPlayerTajwid({super.key, this.index});

  final int? index;

  @override
  State<VideoPlayerTajwid> createState() => _VideoPlayerTajwidState(index!);
}

class _VideoPlayerTajwidState extends State<VideoPlayerTajwid> {
  late int index;
  _VideoPlayerTajwidState(int index) {
    this.index = index;
  }

  late YoutubePlayerController _controller;

  List videoMenu2 = [
    'https://www.youtube.com/watch?v=2m60NTTcmgs',
    'https://www.youtube.com/watch?v=09e0wnyYsTs&t=1s',
    'https://www.youtube.com/watch?v=ygeQ_3OO3oc',
  ];

  List descVideo = [
    'Persembahan Tafaqquh Online untuk ummat | wajib belajar ini dulu (SEBELUM CABANG ILMU TAJWID YANG LAIN) - Ustadz Hardi Damri, Lc',
    'Belajar Membaca Alquran: Ilmu Tajwid - Nun Sukun dan Tanwin - Ustadz Muhammad Ulin Nuha al-Hafidz Banyak di antara kita mungkin masih belum bisa melafadzkan Tajwid alquran dengan benar. Imam Ibnul Jazari menjelaskan:\n “Tajwid adalah membaca dengan membaguskan pelafalannya, yang terhindar dari keburukan pelafalan dan keburukan maknanya, serta membaca dengan maksimal tingkat kebenarannya dan kebagusannya” Berikut ini video belajar ilmu tajwid lengkap beserta hukum bacaan tajwid dalam al-Quran. Mudah mudahan dapat memberikan faedah kepada para pemirsa ketika mempraktikannya dalam membaca al-quran',
    'Pada program ngaji yuk! kali ini, kita akan belajar Tajwid tentang hukum nun sukun atau tanwin. Bersama ustadzah Nabila Abdul Rahim Bayan.',
  ];

  final videoURL = 'https://www.youtube.com/watch?v=Vmw7ne8bDXY';

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoMenu2[index]);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!, flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () => debugPrint('Ready'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: FontStyle.heading,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    descVideo[index],
                    style: FontStyle.menu,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
