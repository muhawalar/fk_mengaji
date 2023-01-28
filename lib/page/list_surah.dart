import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/detail_ayat.dart';
import 'package:flutter/material.dart';

class ListSurah extends StatelessWidget {
  ListSurah({super.key});

  List namaSurah = [
    'An-Nas',
    'Al-Falaq',
    'Al-Ikhlas',
    'Al-Lahab',
    'An-Nasr',
    'Al-Kafirun',
    'Al-Kausar',
    'Al-Ma\'un',
    'Quraisy',
    'Al-Fil'
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
          itemCount: namaSurah.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                surah(
                    context: context,
                    index: index,
                    jumlahAyat: jumlahAyat[index],
                    namaSurah: namaSurah[index]),
              ],
            );
          },
        ));
  }

  Column surah(
      {required BuildContext context,
      required int index,
      required String namaSurah,
      required String jumlahAyat}) {
    return Column(
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            height: 70,
            width: double.infinity,
            color: ColorApp.white,
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Color(0xFF1d3015),
                      child: Center(
                        child: Text(((index + 1).toString()),
                            style:
                                TextStyle(color: ColorApp.white, fontSize: 14)),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                namaSurah,
                style: TextStyle(fontSize: 16, color: ColorApp.black),
              ),
              subtitle: Text(
                jumlahAyat + ' Ayat',
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailSurah(index: index, namaSurah: namaSurah);
              },
            ));
          },
        ),
        Divider(
          thickness: 0.2,
          height: 0.2,
        )
      ],
    );
  }
}
