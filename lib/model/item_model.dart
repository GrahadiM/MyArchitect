class ItemModel {
  final String id;
  final String title;
  final String categoryType;
  final String categoryModel;
  final String author;
  final String image;
  final String price;

  ItemModel({
    this.id,
    this.title,
    this.categoryType,
    this.categoryModel,
    this.author,
    this.image,
    this.price,
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
          : 'https://raw.githubusercontent.com/GrahadiM/MyArchitect_Web/main/public/image/portofolio/step-1.jpg',
      price: json["price"] != null ? json["price"] : "",
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
