import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:fk_mengaji/page/video_player_tajwid.dart';
import 'package:flutter/material.dart';

class ListVideoTajwid extends StatelessWidget {
  ListVideoTajwid({super.key});

  List thumbnailMenu2 = [
    'assets/video/2.1.png',
    'assets/video/2.2.png',
    'assets/video/2.3.png',
  ];

  List videoMenu2 = [
    'https://www.youtube.com/watch?v=2m60NTTcmgs',
    'https://www.youtube.com/watch?v=09e0wnyYsTs&t=1s',
    'https://www.youtube.com/watch?v=ygeQ_3OO3oc',
  ];

  List titleVideoMenu2 = [
    'wajib belahar ini dulu (SEBELUM CABANG ILMU TAJWID YANG LAIN) - Ustadz Hardi Damri, Lc',
    'Belajar Membaca Alquran: Ilmu Tajwid - Nun Sukun dan Tanwin (07)',
    'Belajar Hukum Tajwid Bersama Ustadzah Nabila I Ngaji Yuk',
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
            'Tajwid',
            style: FontStyle.title,
          ),
        ),
        body: ListView.builder(
          itemCount: videoMenu2.length,
          itemBuilder: (context, index) {
            return video(
                index: index,
                context: context,
                thumbnail: thumbnailMenu2[index],
                title: titleVideoMenu2[index]);
          },
        ));
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
              builder: (context) => VideoPlayerTajwid(
                index: index,
              ),
            ));
      },
    );
  }
}
