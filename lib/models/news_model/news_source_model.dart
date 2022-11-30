class NewsSourceModel {
  NewsSourceModel({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) =>
      NewsSourceModel(
        id: json["id"],
        name: json["name"],
      );
}
