class LoginResponseModel {
  final String token;
  final String error;
  final String userId;
  final bool success;

  LoginResponseModel({this.token, this.error, this.success, this.userId});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    print("==========json=============");
    print(json);
    print("==========json=============");
    var userId2 = json["userId"] != null ? json["userId"].toString() : "";
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["message"] != null ? json["message"] : "",
      success: json["success"] != null ? json["success"] : false,
      userId: userId2,
    );
  }
}

class LoginRequestModel {
  String name;
  String email;
  String password;

  LoginRequestModel({
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name != null ? name : email,
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
