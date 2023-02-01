import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/detail_doa.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:fk_mengaji/page/video_player_tahsin.dart';
import 'package:fk_mengaji/page/video_player_tajwid.dart';
import 'package:flutter/material.dart';

class ListDoa extends StatelessWidget {
  ListDoa({super.key});

  List titleDoa = [
    'Doa Masuk Masjid',
    'Doa Keluar Masjid',
    'Doa Masuk WC',
    'Doa Keluar WC',
    'Doa Masuk WC',
    'Doa Keluar WC',
  ];

  List imageDoa = [
    'assets/doa/1.png',
    'assets/doa/2.png',
    'assets/doa/3.png',
    'assets/doa/4.png',
    'assets/doa/5.png',
    'assets/doa/6.png',
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
            'Doa Harian',
            style: FontStyle.title,
          ),
        ),
        body: ListView.builder(
          itemCount: titleDoa.length,
          itemBuilder: (context, index) => InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Text(
                      titleDoa[index],
                      style: FontStyle.subContent,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailDoa(
                      index: index,
                    ),
                  ));
            },
          ),
        ));
  }
}
