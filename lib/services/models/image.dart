// ignore: file_names
class Image {
  String id;
  String imageUrl;

  Image({
    required this.id,
    required this.imageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(id: json['id'], imageUrl: json['imageUrl']);
  }

  static List<Image> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Image.fromJson(json)).toList();
  }
}
