import 'dart:convert';

List<ImageModel> userModelFromJson(String str) =>
    List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));
String userModelToJson(List<ImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
  ImageModel(
      {required this.id,
      required this.name,
      required this.label,
      required this.resolution,
      required this.date,
      required this.image});

  int id;
  String name;
  String label;
  String resolution;
  String date;
  String image;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      id: json["id"],
      name: json["name"],
      label: json["label"],
      resolution: json["resolution"],
      date: json["date"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "label": label,
        "resolution": resolution,
        "date": date,
        "images": image
      };
}
