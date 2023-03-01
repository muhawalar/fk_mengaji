import 'package:fk_mengaji/material/themes_color.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fk_mengaji/material/themes_font.dart';

class VideoPlayerPodcast extends StatefulWidget {
  VideoPlayerPodcast({super.key, this.index});

  final int? index;

  @override
  State<VideoPlayerPodcast> createState() => _VideoPlayerPodcastState(index!);
}

class _VideoPlayerPodcastState extends State<VideoPlayerPodcast> {
  late int index;
  _VideoPlayerPodcastState(int index) {
    this.index = index;
  }

  late YoutubePlayerController _controller;

  List videoMenu4 = [
    'https://youtu.be/6e0wA75u86U',
    'https://youtu.be/fGgneVltQCM',
    'https://www.youtube.com/live/y6r8bh75H_Q?feature=share',
    'https://www.youtube.com/watch?v=DEm7SsysDR0',
    'https://www.youtube.com/watch?v=mQ1Mr66H7c0',
    'https://www.youtube.com/watch?v=lJ6C52WzkBw'
  ];

  List titleVideoMenu4 = [
    'Lika liku Calon Dokter p\'hafal 30 Juz || Podcast Dakwah - Aghar Makhzani Aliah',
    'Cara Dokter Islami Melayani || Podcast Dakwah - Dr. dr. Nasruddin A.M,Sp.OG(K).,MARS.,M.Sc',
    'Podcast Dakwah Kampus Islami | Tips Menghafal Al-Qur\'an | Bersama Mhs FK 2022 Zulfi Zain Alfaruq',
    'Podcast Dakwah Kampus Islami dan Pendidikan Karakter | Mhs FK UMI Hafidz 30 Juz Muhammad Arsy Akbar',
    'Podcast Dakwah Kampus Islami dan Pendidikan Karakter | H.Abdul Qahar Zainal,Lc,M Ed,PhD(Kaprodi PBA)',
    'Podcast bersama dr. M. Erwin Rachman,M.Kes.,Sp.N(K) | Tema : Niat dalam perspektif Neurofisiologi'
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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () => debugPrint('Ready'),
      ),
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
              'Podcast Dakwah',
              style: FontStyle.title,
            ),
          ),
          body: player,
        );
      },
    );

    // Scaffold(
    //   body: SafeArea(
    //     child: ListView(
    //       children: [
    //         YoutubePlayer(
    //           controller: _controller,
    //           showVideoProgressIndicator: true,
    //           onReady: () => debugPrint('Ready'),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Deskripsi',
    //                 style: FontStyle.heading,
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               // Text(
    //               //   descVideo[index],
    //               //   style: FontStyle.menu,
    //               // )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
