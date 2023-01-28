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
    'assets/video/4.1.png',
    'assets/video/4.2.png',
    'assets/video/4.3.png',
  ];

  List videoMenu4 = [
    'https://www.youtube.com/watch?v=Lcc6CvSsrjM',
    'https://www.youtube.com/watch?v=a741aWES5A0',
    'https://www.youtube.com/watch?v=eEM8J9dLCNA',
  ];

  List titleVideoMenu4 = [
    'Kesehatan Islam dan Fikih Kedokteran - Ustadz Dr.Raehanul Bahraen',
    'Fikih Kedokteran 01',
    'Fiqih Kedokteran - Ust. Ahmad Sarwat, Lc. MA',
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
            return levelOfVideo(context: context, index: index);
            // video(
            //     index: index,
            //     context: context,
            //     thumbnail: thumbnailMenu4[index],
            //     title: titleVideoMenu4[index]);
          },
        ));
  }

  SizedBox levelOfVideo({required BuildContext context, required int index}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height + 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.grey.shade200,
              child: Center(
                child: Text(
                  "Kajian",
                  style: FontStyle.subContent,
                  // textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
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
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.grey.shade200,
            child: Center(
              child: Text(
                "Pertanyaan",
                style: FontStyle.subContent,
                // textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
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
