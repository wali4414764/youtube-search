import 'package:flutter/material.dart';
import 'package:waleed/pages/youtube_search/model/item_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  final ItemData item;

  const PlayVideo({super.key, required this.item});

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  YoutubePlayerController? _youtubePlayerController;

  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
        initialVideoId: widget.item.id!.videoId!,
        flags: YoutubePlayerFlags(
          mute: false,
          loop: false,
          forceHD: false,
          isLive: false,
          autoPlay: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: _youtubePlayerController!,
              progressIndicatorColor: Colors.red,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${widget.item.snippet?.title}",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text("${widget.item.snippet?.description}",
          style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400,),),
        ],
      ),
    );
  }
}
