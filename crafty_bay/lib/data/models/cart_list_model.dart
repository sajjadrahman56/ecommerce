import 'cart_item_data.dart';

class CartListModel {
  String? msg;
  List<CartItemData>? cartItemList;

  CartListModel({this.msg, this.cartItemList});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartItemList = <CartItemData>[];
      json['data'].forEach((v) {
        cartItemList!.add(CartItemData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (cartItemList != null) {
      data['data'] = cartItemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
