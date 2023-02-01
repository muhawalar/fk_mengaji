import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fk_mengaji/material/themes_font.dart';

class VideoPlayerKajian extends StatefulWidget {
  VideoPlayerKajian({super.key, this.index});

  final int? index;

  @override
  State<VideoPlayerKajian> createState() => _VideoPlayerKajianState(index!);
}

class _VideoPlayerKajianState extends State<VideoPlayerKajian> {
  late int index;
  _VideoPlayerKajianState(int index) {
    this.index = index;
  }

  late YoutubePlayerController _controller;

  List thumbnailMenu4 = [
    'assets/video/video7.png',
    'assets/video/video7.png',
    'assets/video/video6.png',
    'assets/video/video5.png',
    'assets/video/video4.png',
    'assets/video/video3.png',
    'assets/video/video1.png',
    'assets/video/video1.png',
  ];

  List videoMenu4 = [
    'https://youtu.be/B8OkrPdEDMk',
    'https://youtu.be/opHRbWi5D3E',
    'https://youtu.be/KIEU94Ey_A0',
    'https://youtu.be/36EK0zHJDUo',
    'https://youtu.be/30JwGTkF1ao',
    'https://youtu.be/PRd_LUMfiBU',
    'https://youtu.be/4FJt0Aypt1g',
    'https://youtu.be/igmkdcQ5anI',
  ];

  List titleVideoMenu4 = [
    'Kajian Fiqih Ibadah FK UMI 203 November 2022',
    'Kajian Fiqih Ibadah FK-UMI (23 September 2022)',
    'Kajian Fiqih Ibadah 01 Agustus 2022',
    'Kajian Fiqih Ibadah 30 Juni 2022',
    'Kajian Fiqh Islam FK UMI Bersama Ustadz Syaiful Yusuf (Februari 2022)',
    'Kajian Fiqih Ibadah (Maret 2022)',
    'Kajian Fiqih Ibadah (29 Desember 2021)',
    'Kajian Fiqih Ibadah FK-UMI November 2021',
  ];

  final videoURL = 'https://www.youtube.com/watch?v=Vmw7ne8bDXY';

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoMenu4[index]);
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
                  // Text(
                  //   descVideo[index],
                  //   style: FontStyle.menu,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
