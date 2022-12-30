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

  List videoMenu4 = [
    'https://www.youtube.com/watch?v=Lcc6CvSsrjM',
    'https://www.youtube.com/watch?v=a741aWES5A0',
    'https://www.youtube.com/watch?v=eEM8J9dLCNA',
  ];

  List descVideo = [
    'Bagaimana hubungan tentang ilmu kedokteran saat ini dengan fiqh kedokteran yang ada. Apakah islam juga mengatur tentang Fiqh Kedokteran juga? jawabnya iya. Karena Islam megatur dan mencakup seluruh kehidupan manusia dari mulai jasmani hingga rohani.Ustadz dr. Raehul Bahraen insya Allah akan menjelaskan tentang kesehatan dalam islam dan fiqh kedokteran. Hal ini menjadi wajib kita teliti dan kita pelajari. Karena sejatinya kesehatan dan pengobatan adalah suatu hal yang penting bagi semua insan manusia.Maka kami persembahkan untuk seluruh kaum muslimin sebuah kajian yang mengupas dalam tentang Kesehatan Islam dan Fiqh Kedokteran.',
    '',
    'Ingin Belajar Fiqih dalam genggaman ?silahkan download Aplikasi SEKOLAH FIQIH di Playstore: https://play.google.com/store/apps/de...'
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
