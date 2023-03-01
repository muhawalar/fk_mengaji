import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:fk_mengaji/page/video_player_kajian.dart';
import 'package:fk_mengaji/page/video_player_podcast.dart';
import 'package:fk_mengaji/page/video_player_tahsin.dart';
import 'package:fk_mengaji/page/video_player_tajwid.dart';
import 'package:flutter/material.dart';

class ListVideoPodcast extends StatelessWidget {
  ListVideoPodcast({super.key});

  List thumbnailMenu4 = [
    'assets/video/video8.png',
    'assets/video/video9.png',
    'assets/video/video10.png',
    'assets/video/video11.png',
    'assets/video/video12.png',
    'assets/video/video13.png',
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.white,
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
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return levelOfVideo(
              index: index,
              context: context,
            );
          },
        ));
  }

  SizedBox levelOfVideo({required BuildContext context, required int index}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height + 1500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   width: double.infinity,
          //   height: 50,
          //   color: Colors.grey.shade200,
          //   child: Center(
          //     child: Text(
          //       "Kajian",
          //       style: FontStyle.subContent,
          //       // textAlign: TextAlign.start,
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 12,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: videoMenu4.length,
              itemBuilder: (context, index) {
                return video(
                    index: index,
                    context: context,
                    thumbnail: thumbnailMenu4[index],
                    title: titleVideoMenu4[index]);
              },
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // Container(
          //   width: double.infinity,
          //   height: 50,
          //   color: Colors.grey.shade200,
          //   child: Center(
          //     child: Text(
          //       "Pertanyaan",
          //       style: FontStyle.subContent,
          //       // textAlign: TextAlign.start,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 50,
          // )
        ],
      ),
    );
  }

  Widget video(
      {required String thumbnail,
      required String title,
      required int index,
      BuildContext? context}) {
    return InkWell(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            // leading: CircleAvatar(),
            title: Text(
              title,
              style: FontStyle.titleArticle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // subtitle: Text(
            //   'Subtitle',
            //   style: FontStyle.menu,
            // ),
          ),
          Divider(
            thickness: 1,
          )
        ],
      ),
      onTap: () {
        Navigator.push(
            context!,
            MaterialPageRoute(
              builder: (context) => VideoPlayerPodcast(
                index: index,
              ),
            ));
      },
    );
  }
}
