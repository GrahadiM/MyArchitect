import 'package:shared_preferences/shared_preferences.dart';

class OrderResponseModel {
  final String token;
  final String error;
  final bool success;

  OrderResponseModel({this.token, this.error, this.success});

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    print("==========json=============");
    print(json);
    print("==========json=============");
    return OrderResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["message"] != null ? json["message"] : "",
      success: json["success"] != null ? json["success"] : false,
    );
  }
}

class OrderRequestModel {
  String phone;
  String city;
  String address;
  String order_id;
  String token;
  String price_id;
  String luasLahan;

  OrderRequestModel(
      {this.phone,
      this.city,
      this.address,
      this.order_id,
      this.token,
      this.price_id,
      this.luasLahan});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'wa': phone.trim(),
      'area': city.trim(),
      'address': address.trim(),
      'portofolio_id': order_id.trim(),
      'token': token,
      'price_id': price_id,
      'luasLahan': luasLahan,
    };

    return map;
  }
}
