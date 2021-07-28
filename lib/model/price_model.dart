class PriceModel {
  int id;
  String price;
  String name;
  String desc;

  PriceModel({this.id, this.price, this.name, this.desc});

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    print("==========json=============");
    print(json);
    print("==========json=============");
    return PriceModel(
      id: json["id"] != null ? json["id"] : 0,
      price: json["price"] != null ? json["price"] : 0,
      name: json["name"] != null ? json["name"] : "",
      desc: json["desc"] != null ? json["desc"] : "",
    );
  }
}
