import 'package:shared_preferences/shared_preferences.dart';

class ReviewResponseModel {
  final String token;
  final String error;
  final bool success;

  ReviewResponseModel({this.token, this.error, this.success});

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) {
    print("==========json=============");
    print(json);
    print("==========json=============");
    return ReviewResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["message"] != null ? json["message"] : "",
      success: json["success"] != null ? json["success"] : false,
    );
  }
}

class ReviewRequestModel {
  String comment;
  String star;
  String orderId;
  String token;

  ReviewRequestModel({this.comment, this.star, this.orderId, this.token});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'comment': comment.trim(),
      'star': star.toString(),
      'order_id': orderId.trim(),
      'token': token,
    };

    return map;
  }
}
