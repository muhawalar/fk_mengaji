import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:flutter/material.dart';

class ListVideoHijaiyah extends StatelessWidget {
  ListVideoHijaiyah({super.key});

  List thumbnailMenu1 = [
    'assets/video/1.1.png',
    'assets/video/1.2.png',
    'assets/video/1.3.png',
  ];

  List videoMenu1 = [
    'https://www.youtube.com/watch?v=Vmw7ne8bDXY',
    'https://www.youtube.com/watch?v=F0LdmE9eedc',
    'https://www.youtube.com/watch?v=tma3IEvek2A'
  ];

  List titleVideoMenu1 = [
    'BELAJAR MUDAH PENYEBUTAN HURUF HIJAIYAH YANG BAIK & BENAR | Ustadz Hardi Damri, Lc',
    'MENGENAL NAMA NAMA HURUF HIJAIYAH',
    'Cara membaca huruf hijaiyah dengan baik dan benar - Ustadz Adi Hidayat'
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
            'Huruf Hijaiyah',
            style: FontStyle.title,
          ),
        ),
        body: ListView.builder(
          itemCount: videoMenu1.length,
          itemBuilder: (context, index) {
            return video(
                index: index,
                context: context,
                thumbnail: thumbnailMenu1[index],
                title: titleVideoMenu1[index]);
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
              builder: (context) => VideoPlayerHijaiyah(
                index: index,
              ),
            ));
      },
    );
  }
}
