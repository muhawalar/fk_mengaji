import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
          ],
        ),
      ),
    );
  }
}
