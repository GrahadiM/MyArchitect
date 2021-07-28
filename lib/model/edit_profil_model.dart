class EditProfilResponseModel {
  final String token;
  final String error;
  final bool success;

  EditProfilResponseModel({this.token, this.error, this.success});

  factory EditProfilResponseModel.fromJson(Map<String, dynamic> json) {
    print("==========json=============");
    print(json);
    print("==========json=============");
    return EditProfilResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["message"] != null ? json["message"] : "",
      success: json["success"] != null ? json["success"] : false,
    );
  }
}

class EditProfilRequestModel {
  String username;
  String phone;
  String description;
  String city;
  String address;
  String email;
  String password;
  String userId;

  EditProfilRequestModel(
      {this.username,
      this.phone,
      this.description,
      this.city,
      this.address,
      this.email,
      this.password,
      this.userId});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': username.trim(),
      'phone': phone.trim(),
      'desc': description.trim(),
      'city': city.trim(),
      'address': address.trim(),
      'email': email.trim(),
      'password': password.trim(),
      'userId': userId.trim(),
    };

    return map;
  }
}
