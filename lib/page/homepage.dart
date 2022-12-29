import 'dart:async';

import 'package:fk_mengaji/material/themes_color.dart';
import 'package:fk_mengaji/material/themes_font.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fk_mengaji/page/list_video_hijaiyah.dart';
import 'package:fk_mengaji/page/list_video_tajwid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // final listImage = [
  //   'assets/gambar1.jpg',
  //   'assets/gambar2.jpg',
  //   'assets/gambar3.jpg',
  //   'assets/gambar4.jpg',
  //   'assets/gambar5.jpg',
  // ];

  final listImage = [
    Image.asset(
      'assets/gambar1.jpg',
      fit: BoxFit.fitHeight,
    ),
    Image.asset(
      'assets/gambar2.jpg',
      fit: BoxFit.fitHeight,
    ),
    Image.asset(
      'assets/gambar3.jpg',
      fit: BoxFit.fitHeight,
    ),
    Image.asset(
      'assets/gambar4.jpg',
      fit: BoxFit.fitHeight,
    ),
    Image.asset(
      'assets/gambar5.jpg',
      fit: BoxFit.fitHeight,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        title: Text(
          'Assalamualaikum, Akhi',
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
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/pagi.jpg',
                      fit: BoxFit.cover,
                      // color: ColorApp.white.withOpacity(0.3),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    icon: 'assets/hijaiyah.png',
                    title: 'Huruf Hijaiyah',
                    index: 0),
                menu(icon: 'assets/tajwid.png', title: 'Tajwid', index: 1),
                menu(icon: 'assets/tahsin.png', title: 'Tahsin', index: 2),
                menu(
                    icon: 'assets/kajian.png', title: 'Kajian Fiqih', index: 3),
                // menu(),
                // menu(),
                // menu(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Gallery',
              style: FontStyle.subContent,
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   height: 180,
            //   child: ListView.builder(
            //     scrollDirection: ,
            //       itemCount: listImage.length,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           height: 150,
            //           width: double.infinity,
            //           color: ColorApp.black,
            //           // child: Image.asset(listImage[index]),
            //         );
            //       }),
            // ),
            Container(
              height: 400,
              width: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: CarouselSlider(
                  items: listImage,
                  options: CarouselOptions(
                      aspectRatio: 0.2,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true)),
            ),
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
              constraints: BoxConstraints(maxHeight: 500),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [article(), Divider()],
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
                color: ColorApp.green.withOpacity(0.6)),
            child: Image.asset(
              icon,
              height: 50,
              width: 50,
              scale: 10,
              // fit: BoxFit.scaleDown,
              color: ColorApp.white,
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return index == 0 ? ListVideoHijaiyah() : ListVideoTajwid();
              },
            ));
          },
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: FontStyle.menu,
        )
      ],
    );
  }
}

class article extends StatelessWidget {
  const article({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: ColorApp.green),
          ),
        )
      ],
    );
  }
}
