import 'home_banner_data.dart';

class HomeBannerListModel {
  String? msg;
  List<BannerData>? bannerDataList;

  HomeBannerListModel({this.msg, this.bannerDataList});

  HomeBannerListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      bannerDataList = <BannerData>[];
      json['data'].forEach((v) {
        bannerDataList!.add(BannerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (bannerDataList != null) {
      data['data'] = bannerDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
