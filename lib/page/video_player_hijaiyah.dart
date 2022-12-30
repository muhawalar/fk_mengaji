import 'package:fk_mengaji/material/themes_font.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerHijaiyah extends StatefulWidget {
  VideoPlayerHijaiyah({super.key, this.index});

  final int? index;

  @override
  State<VideoPlayerHijaiyah> createState() => _VideoPlayerHijaiyahState(index!);
}

class _VideoPlayerHijaiyahState extends State<VideoPlayerHijaiyah> {
  late int index;
  _VideoPlayerHijaiyahState(int index) {
    this.index = index;
  }

  late YoutubePlayerController _controller;

  List videoMenu1 = [
    'https://www.youtube.com/watch?v=Vmw7ne8bDXY',
    'https://www.youtube.com/watch?v=F0LdmE9eedc',
    'https://www.youtube.com/watch?v=tma3IEvek2A'
  ];

  List descVideo = [
    'Dipersembahkan untuk ummat oleh Tafaqquh Study Club, Pekanbaru - Riau. Follow kami di Twitter: @tafaqquhonline | Instagram: @tafaqquhonline | Facebook: Redaksi Tafaqquh.Dukung Tafaqquh Video dengan berbelanja di Toko Buku Tafaqquh, menjual buku-buku karya Asatidz Tafaqquh Study Club, serta berbagai kategori buku Islam lainnya. Alamat: Jalan Duyung No. 39DE (depan Masjid Nurul Haq), Kec. Marpoyan Damai, Pekanbaru, Riau. Kontak pemesanan: 0852-6544-8857. Bukalapak: Toko Buku Tafaqquh http://www.bukalapak.com/tbtafaqquh. Keuntungan dari penjualan buku akan digunakan kembali untuk biaya operasional dakwah, termasuk pembuatan konten dakwah yang kami upload di Youtube. Insya Allah menjadi amal jariyah untuk para pembeli jika diniatkan ikhlas karena Allah. PERHATIAN - Silahkan share video-video Tafaqquh',
    'huruf Hijaiyah merupakan bagian terpenting dari kegiatan belajar membaca Alquran. Like, Comment, Subscribe dan Share terus video-video dari NgajiBareng04',
    'Mari Simak Video Ustadz Adi Hidayat berikut ini, membahas tentang bagaimana cara membaca huruf hijaiyah dengan baik dan benar Sebarkan seluas-luasnya  kebaikan dengan share video ini, subscribe channel dan aktifkan notifikasi untuk mendapatkan ilmu dan informasi terbaru dari Ustadz Adi Hidayat, Lc., MA.'
  ];

  final videoURL = 'https://www.youtube.com/watch?v=Vmw7ne8bDXY';

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoMenu1[index]);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!, flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () => debugPrint('Ready'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: FontStyle.heading,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    descVideo[index],
                    style: FontStyle.menu,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
