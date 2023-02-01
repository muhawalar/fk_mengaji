import 'dart:async';

import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fk_mengaji/page/list_surah.dart';
import 'package:fk_mengaji/page/list_doa.dart';
import 'package:fk_mengaji/page/list_video_hijaiyah.dart';
import 'package:fk_mengaji/page/list_video_kajian.dart';
import 'package:fk_mengaji/page/list_video_tahsin.dart';
import 'package:fk_mengaji/page/list_video_tajwid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String clock = 'Clock Here';
  late Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        clock = DateFormat('HH:mm:ss').format(DateTime.now());
      });
    });
    super.initState();
  }

  final image = [
    'assets/gambar1.jpg',
    'assets/gambar2.jpg',
    'assets/gambar3.jpg',
    'assets/gambar4.jpg',
    'assets/gambar5.jpg',
    'assets/gambar6.jpg',
    'assets/gambar7.jpg',
    'assets/gambar8.jpg',
    'assets/gambar9.jpg',
    'assets/gambar10.jpg',
    'assets/gambar11.jpg',
    'assets/gambar12.jpg',
    'assets/gambar13.jpg',
    'assets/gambar14.jpg',
    'assets/gambar15.jpg',
  ];

  final imageArticle = [
    'assets/artikel1.png',
    'assets/artikel2.png',
    'assets/artikel3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorApp.white,
        title: Text(
          'FK-UMI MENGAJI',
          style: FontStyle.heading,
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: ColorApp.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/bg.jpg',
                      fit: BoxFit.cover,
                      // color: ColorApp.white.withOpacity(0.3),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 24, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clock,
                        style: FontStyle.timeOfPray,
                      ),
                      Text(
                        'Makassar, Sulawesi Selatan',
                        style: FontStyle.place,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                menu(
                    icon: 'assets/menu1.png',
                    title: 'Al-Quran & Terjemahan',
                    index: 0),
                menu(icon: 'assets/menu2.png', title: 'Doa Harian', index: 1),
                menu(icon: 'assets/menu3.png', title: 'Tahsin', index: 2),
                menu(icon: 'assets/menu4.png', title: 'Kajian Fiqih', index: 3),
                // menu(),
                // menu(),
                // menu(),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Gallery',
              style: FontStyle.subContent,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: CarouselSlider(
              options: CarouselOptions(autoPlay: true, height: 300),
              items: image
                  .map((item) => Container(
                      height: 300,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(item, fit: BoxFit.cover
                            // width: 1000,
                            ),
                      ))))
                  .toList(),
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Artikel',
              style: FontStyle.subContent,
            ),
            SizedBox(
              height: 15,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 350),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      article(
                        index: index,
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column menu({
    int? index,
    required String icon,
    required String title,
  }) {
    return Column(
      children: [
        InkWell(
          child: Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorApp.green.withOpacity(0.3)),
            child: Image.asset(
              icon,
              height: 50,
              width: 50,
              scale: 5,

              // color: ColorApp.white,
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return index == 0
                    ? ListSurah()
                    : index == 1
                        ? ListDoa()
                        : index == 2
                            ? ListVideoTahsin()
                            : ListVideoKajian();
              },
            ));
          },
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 50,
          width: 72,
          child: Text(
            title,
            style: FontStyle.menu,
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}

class article extends StatelessWidget {
  article({
    required this.index,
    super.key,
  });

  int index;

  final linkArticle = [
    'https://makassar.tribunnews.com/2021/06/17/fakultas-kedokteran-umi-bahas-gangguan-haid-dan-cara-mengatasinya',
    'https://makassar.tribunnews.com/2022/06/04/milad-fk-umi-ke-3-dekade-international-conference-hingga-bakti-sosial-diselenggarakan',
    'https://makassar.tribunnews.com/2022/04/09/direktur-rs-ibnu-sina-dr-nasruddin-andi-mappaware-resmi-dilantik-jadi-plt-dekan-fk-umi'
  ];

  final titleArticle = [
    'Fakultas Kedokteran UMI Bahas Gangguan Haid dan Cara Mengatasinya',
    'Milad FK UMI ke-3 Dekade, International Conference hingga Bakti Sosial Diselenggarakan',
    'Direktur RS Ibnu Sina Dr Nasruddin Andi Mappaware Resmi Dilantik Jadi Plt Dekan FK UMI'
  ];

  final imageArticle = [
    'https://cdn-2.tstatic.net/makassar/foto/bank/images/talkshow-gangguan-haid-dan-cara-mengatasinya-1762921.jpg',
    'https://cdn-2.tstatic.net/makassar/foto/bank/images/Fakultas-Kedokteran-UMI-Kala-Berkunjung-Ke-Redaksi-Tribun-Timurcom.jpg',
    'https://cdn-2.tstatic.net/makassar/foto/bank/images/Plt-Dekan-Fakultas-Kedokteran-Dr-Nasruddin-Andi-Mappaware.jpg',
  ];

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              titleArticle[index],
              style: FontStyle.titleArticle,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 100,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageArticle[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
      onTap: () {
        Uri _url = Uri.parse(linkArticle[index]);
        _launchUrl(_url);
      },
    );
  }
}
