import 'package:fk_mengaji/material/themes_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  List thumbnailMenu3 = [
    'assets/video/level1.png',
    'assets/video/level2.png',
    'assets/video/level3.png',
    'assets/video/level4.png',
    'assets/video/level5.png',
    'assets/video/level6.png',
    'assets/video/level7.png',
    'assets/video/level8.png',
    'assets/video/level9.png',
    'assets/video/level10.png',
  ];

  List videoMenu3 = [
    'https://youtu.be/CUspH8i3wmg',
    'https://youtu.be/wQK9sESDVj0',
    'https://youtu.be/V0T33fzBMfI',
    'https://youtu.be/SvU_4RY7YwU',
    'https://youtu.be/ljUZybJsE_k',
    'https://youtu.be/JcVRb1HtOCg',
    'https://youtu.be/NGYmukXWJZ8',
    'https://youtu.be/a5MyVm8zy6Y',
    'https://youtu.be/xa15v0OnyVc',
    'https://youtu.be/1cr5Q0L2vws',
  ];

  List titleVideoMenu3 = [
    'Level 1',
    'Level 2',
    'Level 3',
    'Level 4',
    'Level 5',
    'Level 5',
    'Level 6',
    'Level 7',
    'Level 8',
    'Level 9',
    'Level 10',
  ];

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoMenu3[index]);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!, flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorApp.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: ColorApp.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              'Level ' + (index + 1).toString(),
              style: FontStyle.title,
            ),
          ),
          body: player,
        );
      },
    );

    // Scaffold(
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor: ColorApp.white,
    //     leading: IconButton(
    //       icon: Icon(
    //         Icons.arrow_back_outlined,
    //         color: ColorApp.black,
    //       ),
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //     ),
    //     centerTitle: true,
    //     title: Text(
    //       'Level ' + (index + 1).toString(),
    //       style: FontStyle.title,
    //     ),
    //   ),
    //   body: YoutubePlayerBuilder(
    //     builder: (context, player) {
    //       return Scaffold(
    //         body: ,
    //       )
    //       );
    //     },
    //     // onExitFullScreen: () {
    //     //   SystemChrome.setPreferredOrientations([
    //     //     DeviceOrientation.landscapeLeft,
    //     //     DeviceOrientation.landscapeRight
    //     //   ]);
    //     // },
    //     player: YoutubePlayer(
    //       controller: _controller,
    //       showVideoProgressIndicator: true,
    //       onReady: () => debugPrint('Ready'),
    //     ),
    //   ),
    // );
  }
}
