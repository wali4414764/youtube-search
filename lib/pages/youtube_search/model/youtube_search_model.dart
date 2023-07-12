import 'package:waleed/pages/youtube_search/model/item_data.dart';
import 'package:waleed/pages/youtube_search/model/page_info_data.dart';

class YoutubeSearchModel {
  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final String? regionCode;
  final PageInfoData? pageInfo;
  final List<ItemData>? items;

  YoutubeSearchModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.items,
  });

  factory YoutubeSearchModel.fromJson(Map<String, dynamic> json) {
    final items = json['items'] as List;
    List<ItemData> itemData =
        items.map((singleItem) => ItemData.fromjson(singleItem)).toList();

    return YoutubeSearchModel(
      etag: json['etag'],
      kind: json['kind'],
      nextPageToken: json['nextPageToken'],
      regionCode: json['regionCode'],
      pageInfo: PageInfoData.fromjson(json['pageInfo']),
      items: itemData,
    );
  }
}
