class ItemModel {
  final String id;
  final String title;
  final String categoryType;
  final String categoryModel;
  final String author;
  final String image;
  final String price;
  final String user_id;

  ItemModel({
    this.id,
    this.title,
    this.categoryType,
    this.categoryModel,
    this.author,
    this.image,
    this.price,
    this.user_id,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    print("==========json=============");
    print(json);
    print("==========json=============");
    return ItemModel(
      id: json["id"] != null ? json["id"].toString() : "",
      title: json["title"] != null ? json["title"] : "",
      categoryType:
          json["category_type_name"] != null ? json["category_type_name"] : "",
      categoryModel: json["category_model_name"] != null
          ? json["category_model_name"]
          : "",
      author: json["author"] != null ? json["author"] : "",
      image: json["url_image"] != null
          ? json["url_image"]
          : 'http://raw.githubusercontent.com/GrahadiM/MyArchitect_Web/main/public/image/portofolio/step-1.jpg',
      price: "",
      user_id: "",
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
