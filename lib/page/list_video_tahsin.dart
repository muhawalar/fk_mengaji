import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:fk_mengaji/page/video_player_tahsin.dart';
import 'package:fk_mengaji/page/video_player_tajwid.dart';
import 'package:flutter/material.dart';

class ListVideoTahsin extends StatelessWidget {
  ListVideoTahsin({super.key});

  List logoLevel = [
    'assets/level_tahsin/level1.png',
    'assets/level_tahsin/level2.png',
    'assets/level_tahsin/level3.png',
    'assets/level_tahsin/level4.png',
    'assets/level_tahsin/level5.png',
    'assets/level_tahsin/level6.png',
    'assets/level_tahsin/level7.png',
    'assets/level_tahsin/level8.png',
    'assets/level_tahsin/level9.png',
    'assets/level_tahsin/level10.png',
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
            'Tahsin',
            style: FontStyle.title,
          ),
        ),
        body: ListView.builder(
          itemCount: logoLevel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                surah(context: context, index: index, image: logoLevel[index]
                    // jumlahAyat: jumlahAyat[index],
                    // namaSurah: namaSurah[index]
                    ),
              ],
            );
          },
        ));
  }

  Column surah({
    required BuildContext context,
    required int index,
    required String image,
    // required String namaSurah,
    // required String jumlahAyat
  }) {
    return Column(
      children: [
        InkWell(
          child: Container(
              height: 50,
              width: double.infinity,
              color: ColorApp.white,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return VideoPlayerTahsin(index: index);
              },
            ));
          },
        ),
        // SizedBox(
        //   height: 1,
        // )
      ],
    );
  }
}
