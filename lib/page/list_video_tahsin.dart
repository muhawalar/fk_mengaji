import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:fk_mengaji/page/video_player_hijaiyah.dart';
import 'package:fk_mengaji/page/video_player_tahsin.dart';
import 'package:fk_mengaji/page/video_player_tajwid.dart';
import 'package:flutter/material.dart';

class ListVideoTahsin extends StatelessWidget {
  ListVideoTahsin({super.key});

  List thumbnailMenu3 = [
    'assets/video/level1.png',
    'assets/video/level2.png',
    'assets/video/level3.png',
    'assets/video/level4.png',
    'assets/video/level5.png',
  ];

  List videoMenu3 = [
    'https://youtu.be/CUspH8i3wmg',
    'https://youtu.be/wQK9sESDVj0',
    'https://youtu.be/V0T33fzBMfI',
    'https://youtu.be/SvU_4RY7YwU',
    'https://youtu.be/ljUZybJsE_k',
  ];

  List titleVideoMenu3 = [
    'Level 1',
    'Level 2',
    'Level 3',
    'Level 4',
    'Level 5',
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
          itemCount: videoMenu3.length,
          itemBuilder: (context, index) => InkWell(
            child: Column(
              children: [
                Container(
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
                SizedBox(
                  height: 10,
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerTahsin(
                      index: index,
                    ),
                  ));
            },
          ),
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
