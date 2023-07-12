


class ThumbnailData{
  final String? url;
  final int? width;
  final int? height;

  ThumbnailData({this.url, this.width, this.height});


  factory ThumbnailData.fromjson(Map<String,dynamic> json){
    return ThumbnailData(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }


}