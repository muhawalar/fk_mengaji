import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:fk_mengaji/page/video_player_kajian.dart';
import 'package:fk_mengaji/page/video_player_tahsin.dart';
import 'package:fk_mengaji/page/video_player_tajwid.dart';
import 'package:flutter/material.dart';

class ListVideoKajian extends StatelessWidget {
  ListVideoKajian({super.key});

  List thumbnailMenu4 = [
    'assets/video/video7.png',
    'assets/video/video7.png',
    'assets/video/video6.png',
    'assets/video/video5.png',
    'assets/video/video4.png',
    'assets/video/video3.png',
    'assets/video/video1.png',
    'assets/video/video1.png',
  ];

  List videoMenu4 = [
    'https://youtu.be/B8OkrPdEDMk',
    'https://youtu.be/opHRbWi5D3E',
    'https://youtu.be/KIEU94Ey_A0',
    'https://youtu.be/36EK0zHJDUo',
    'https://youtu.be/30JwGTkF1ao',
    'https://youtu.be/PRd_LUMfiBU',
    'https://youtu.be/4FJt0Aypt1g',
    'https://youtu.be/igmkdcQ5anI',
  ];

  List titleVideoMenu4 = [
    'Kajian Fiqih Ibadah FK UMI 203 November 2022',
    'Kajian Fiqih Ibadah FK-UMI (23 September 2022)',
    'Kajian Fiqih Ibadah 01 Agustus 2022',
    'Kajian Fiqih Ibadah 30 Juni 2022',
    'Kajian Fiqh Islam FK UMI Bersama Ustadz Syaiful Yusuf (Februari 2022)',
    'Kajian Fiqih Ibadah (Maret 2022)',
    'Kajian Fiqih Ibadah (29 Desember 2021)',
    'Kajian Fiqih Ibadah FK-UMI November 2021',
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
            'Kajian Fikih ',
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
              builder: (context) => VideoPlayerKajian(
                index: index,
              ),
            ));
      },
    );
  }
}
