import 'category_data.dart';

class CategoryListModel {
  String? msg;
  List<CategoryData>? categoryDataList;

  CategoryListModel({this.msg, this.categoryDataList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryDataList = <CategoryData>[];
      json['data'].forEach((v) {
        categoryDataList!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categoryDataList != null) {
      data['data'] = categoryDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
