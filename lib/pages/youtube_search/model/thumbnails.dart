


import 'package:waleed/pages/youtube_search/model/thumbnail_data.dart';

class Thumbnails{
  final ThumbnailData? medium;
  final ThumbnailData? high;

  Thumbnails({ this.medium, this.high});


  factory Thumbnails.fromjson(Map<String,dynamic> json){
    return Thumbnails(
      medium:ThumbnailData.fromjson(json['medium']),
      high: ThumbnailData.fromjson(json['high']),
    );
  }

}