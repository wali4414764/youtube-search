




class IdData{
  final String? kind;
  final String? videoId;

  IdData({ this.kind,  this.videoId});


  factory IdData.fromjson(Map<String,dynamic> json){
    return IdData(
        kind: json['kind'],
        videoId:json ['videoId']

    );
  }


}