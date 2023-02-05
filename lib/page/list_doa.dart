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
    'Doa Masuk Rumah',
    'Doa Keluar Rumah',
  ];

  List imageDoa = [
    'assets/doa1-logo.png',
    'assets/doa2-logo.png',
    'assets/doa3-logo.png',
    'assets/doa4-logo.png',
    'assets/doa5-logo.png',
    'assets/doa6-logo.png',
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
          itemCount: imageDoa.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                surah(context: context, index: index, image: imageDoa[index]
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
              )
              // ListTile(
              //   leading: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       ClipRRect(
              //         borderRadius: BorderRadius.circular(15),
              //         child: Container(
              //           height: 30,
              //           width: 30,
              //           color: Color(0xFF1d3015),
              //           child: Center(
              //             child: Text(((index + 1).toString()),
              //                 style:
              //                     TextStyle(color: ColorApp.white, fontSize: 14)),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              //   title: Text(
              //     namaSurah,
              //     style: TextStyle(fontSize: 16, color: ColorApp.black),
              //   ),
              //   subtitle: Text(
              //     jumlahAyat + ' Ayat',
              //     style: TextStyle(color: Colors.green, fontSize: 12),
              //   ),
              // ),
              ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailDoa(index: index);
              },
            ));
          },
        ),
        SizedBox(
          height: 1,
        )
      ],
    );
  }
}
