import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/detail_ayat.dart';
import 'package:flutter/material.dart';

class ListSurah extends StatelessWidget {
  ListSurah({super.key});

  List logoSurah = [
    'assets/surah/al-fil-logo.png',
    'assets/surah/quraisy-logo.png',
    'assets/surah/al-maun-logo.png',
    'assets/surah/al-kausar-logo.png',
    'assets/surah/al-kafirun-logo.png',
    'assets/surah/an-nasr-logo.png',
    'assets/surah/al-lahab-logo.png',
    'assets/surah/al-ikhlas-logo.png',
    'assets/surah/al-falaq-logo.png',
    'assets/surah/an-nas-logo.png',
    // 'An-Nas',
    // 'Al-Falaq',
    // 'Al-Ikhlas',
    // 'Al-Lahab',
    // 'An-Nasr',
    // 'Al-Kafirun',
    // 'Al-Kausar',
    // 'Al-Ma\'un',
    // 'Quraisy',
    // 'Al-Fil'
  ];

  List jumlahAyat = ['6', '5', '4', '5', '3', '6', '3', '7', '4', '5'];

  @override
  Widget build(BuildContext context) {
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
            'Al-Qur\'an & Terjemahan',
            style: FontStyle.title,
          ),
        ),
        body: ListView.builder(
          itemCount: logoSurah.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                surah(context: context, index: index, image: logoSurah[index]
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
              height: 80,
              width: double.infinity,
              color: ColorApp.white,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailSurah(index: index);
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
