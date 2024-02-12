
import 'package:crafty_bay/data/models/brand_data.dart';

class BrandListModel {
  String? msg;
  List<BrandData>? brandDataList;

  BrandListModel({this.msg, this.brandDataList});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      brandDataList = <BrandData>[];
      json['data'].forEach((v) {
        brandDataList!.add(BrandData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (brandDataList != null) {
      data['data'] = brandDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
