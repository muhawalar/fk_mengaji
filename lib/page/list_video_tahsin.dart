import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:fk_mengaji/page/video_player_tahsin.dart';
import 'package:fk_mengaji/page/video_player_tajwid.dart';
import 'package:flutter/material.dart';

class ListVideoTahsin extends StatelessWidget {
  ListVideoTahsin({super.key});

  List thumbnailMenu3 = [
    'assets/video/3.1.png',
    'assets/video/3.2.png',
    'assets/video/3.3.png',
  ];

  List videoMenu3 = [
    'https://www.youtube.com/watch?v=na4zMsNNJIM',
    'https://www.youtube.com/watch?v=Aih1YP-VEgo',
    'https://www.youtube.com/watch?v=zdty_Af410U',
  ];

  List titleVideoMenu3 = [
    'Belajar Pengucapan HURUF HIJAIYAH || Ustadz Abu Rabbani',
    'AIUBA LATIHAN PENGUCAPAN HURUF MENGGUNAKAN HUKUM TAJWID (cara cepat bisa membaca Al Qur\'an',
    'Bahasa Arab paling ringan (1) - Huruf Hijaiyyah part(1)',
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
          itemCount: 3,
          itemBuilder: (context, index) {
            return levelOfVideo(context: context, index: index);
            // video(
            //     index: index,
            //     context: context,
            //     thumbnail: thumbnailMenu3[index],
            //     title: titleVideoMenu3[index]);
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
                  'Level ' + (index + 1).toString(),
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
              itemCount: videoMenu3.length,
              itemBuilder: (context, index) {
                return video(
                    index: index,
                    context: context,
                    thumbnail: thumbnailMenu3[index],
                    title: titleVideoMenu3[index]);
              },
            ),
          ),
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
        // crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
            context!,
            MaterialPageRoute(
              builder: (context) => VideoPlayerTahsin(
                index: index,
              ),
            ));
      },
    );
  }
}
