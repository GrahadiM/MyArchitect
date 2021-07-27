class CategoryAllModel {
  final String id;
  final String title;
  final String slug;

  CategoryAllModel({
    this.id,
    this.title,
    this.slug,
  });

  factory CategoryAllModel.fromJson(Map<String, dynamic> json) {
    return CategoryAllModel(
      id: json["id"] != null ? json["id"].toString() : "",
      title: json["title"] != null ? json["title"] : "",
      slug: json["slug"] != null ? json["slug"] : "",
    );
  }
}
