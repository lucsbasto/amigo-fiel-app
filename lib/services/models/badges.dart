class CustomBadge {
  final String id;
  final String name;
  final String description;
  final int threshold;
  final String imageUrl;

  CustomBadge({
    required this.id,
    required this.name,
    required this.description,
    required this.threshold,
    required this.imageUrl,
  });

  factory CustomBadge.fromJson(Map<String, dynamic> json) {
    return CustomBadge(
      id: json['id']! as String,
      name: json['name']! as String,
      description: json['description']! as String,
      threshold: json['threshold']! as int,
      imageUrl: json['imageUrl']! as String,
    );
  }
}
