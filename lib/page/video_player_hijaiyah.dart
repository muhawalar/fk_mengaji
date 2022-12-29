import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerHijaiyah extends StatefulWidget {
  VideoPlayerHijaiyah({super.key, this.index});

  final int? index;

  @override
  State<VideoPlayerHijaiyah> createState() => _VideoPlayerHijaiyahState(index!);
}

class _VideoPlayerHijaiyahState extends State<VideoPlayerHijaiyah> {
  late int index;
  _VideoPlayerHijaiyahState(int index) {
    this.index = index;
  }

  late YoutubePlayerController _controller;

  List videoMenu1 = [
    'https://www.youtube.com/watch?v=Vmw7ne8bDXY',
    'https://www.youtube.com/watch?v=F0LdmE9eedc',
    'https://www.youtube.com/watch?v=tma3IEvek2A'
  ];

  final videoURL = 'https://www.youtube.com/watch?v=Vmw7ne8bDXY';

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoMenu1[index]);
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
