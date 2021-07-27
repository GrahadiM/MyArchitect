class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String address;
  String city;
  String desc;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.desc});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone != null ? this.phone : '';
    data['address'] = this.address != null ? this.address : '';
    data['city'] = this.city;
    data['desc'] = this.desc != null ? this.desc : '';
    return data;
  }
}
