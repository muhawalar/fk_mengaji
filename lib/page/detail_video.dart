// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayer extends StatefulWidget {
//   const VideoPlayer({super.key});

//   @override
//   State<VideoPlayer> createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoPlayer> {
//   late VideoPlayerController controller;
//   ChewieController? chewieController;

//   Future<void> loadVideoPlayer() async {
//     controller = VideoPlayerController.network(
//         'https://www.youtube.com/shorts/v_BmSef3vvo');

//     await Future.wait([controller.initialize()]);

//     chewieController = ChewieController(
//         videoPlayerController: controller, autoPlay: false, looping: false);
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadVideoPlayer();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     chewieController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//               child: Center(
//                   child: chewieController != null &&
//                           chewieController!
//                               .videoPlayerController.value.isInitialized
//                       ? Chewie(controller: chewieController!)
//                       : Center(
//                           child: CircularProgressIndicator(),
//                         )))
//         ],
//       ),
//     );
//   }
// }
