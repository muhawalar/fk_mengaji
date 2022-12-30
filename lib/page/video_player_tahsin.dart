import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fk_mengaji/material/themes_font.dart';

class VideoPlayerTahsin extends StatefulWidget {
  VideoPlayerTahsin({super.key, this.index});

  final int? index;

  @override
  State<VideoPlayerTahsin> createState() => _VideoPlayerTahsinState(index!);
}

class _VideoPlayerTahsinState extends State<VideoPlayerTahsin> {
  late int index;
  _VideoPlayerTahsinState(int index) {
    this.index = index;
  }

  late YoutubePlayerController _controller;

  List videoMenu3 = [
    'https://www.youtube.com/watch?v=na4zMsNNJIM',
    'https://www.youtube.com/watch?v=Aih1YP-VEgo',
    'https://www.youtube.com/watch?v=zdty_Af410U',
  ];

  List descVideo = [
    'Terimakasih atas kunjungannya.',
    'AIUBA LATIHAN PENGUCAPAN HURUF MENGGUNAKAN HUKUM-HUKUM TAJWID. Video kali ini membahas latihan pengucapan huruf hijaiyah menggunakan hukum-hukum tajwid. Supaya terbiasa Dan lancar dalam membaca Al Quran. Video ini kami buat Dungan harapan bisa memberikan Banyak manfaat bagi sahabat yang belum begitu lancar dalam melafalkan huruf. ',
    'Dari anak-anak sampai kakek-kakek boleh belajar dengan cara ini'
  ];

  final videoURL = 'https://www.youtube.com/watch?v=Vmw7ne8bDXY';

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoMenu3[index]);
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
