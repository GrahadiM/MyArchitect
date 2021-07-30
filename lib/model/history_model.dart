class HistoryModel {
  final String id;
  final String title;
  final String categoryType;
  final String categoryModel;
  final String author;
  final String image;
  final String price;
  final String userId;
  final String progresAkhir;
  final String desc;
  final List progress;

  HistoryModel(
      {this.id,
      this.title,
      this.categoryType,
      this.categoryModel,
      this.author,
      this.image,
      this.price,
      this.userId,
      this.progresAkhir,
      this.desc,
      this.progress});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    print("==========json=============");
    print(json);
    print("==========json=============");
    return HistoryModel(
      id: json["id"] != null ? json["id"].toString() : "",
      title: json["portofolio"]["title"] != null
          ? json["portofolio"]["title"]
          : "",
      categoryType: json["portofolio"]["category_type_name"] != null
          ? json["portofolio"]["category_type_name"]
          : "",
      categoryModel: json["portofolio"]["category_model_name"] != null
          ? json["portofolio"]["category_model_name"]
          : "",
      author: json["portofolio"]["author"] != null
          ? json["portofolio"]["author"]
          : "",
      image: json["portofolio"]["url_image"] != null
          ? json["portofolio"]["url_image"]
          : 'https://raw.githubusercontent.com/GrahadiM/MyArchitect_Web/main/public/image/portofolio/step-1.jpg',
      price: json["price"] != null ? json["price"] : "",
      userId: json["user_id"] != null ? json["user_id"].toString() : "",
      progresAkhir: json["progres_akhir"] != "{}"
          ? json["progres_akhir"]["name"]
          : "Belum Ada Progres",
      progress: json["progres_akhir"] != "{}" ? json["progres"] : [],
      desc:
          json["portofolio"]["desc"] != null ? json["portofolio"]["desc"] : "",
    );
  }
}

// class LoginRequestModel {
//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> map = {
//       'email': email.trim(),
//       'password': password.trim(),
//     };

//     return map;
//   }
// }
