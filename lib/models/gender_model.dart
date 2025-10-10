class GenderModel {
  final String title;
  final String image;

  GenderModel({
    required this.title,
    required this.image,
  });

  // Create from JSON / Map
  factory GenderModel.fromMap(Map<String, dynamic> map) {
    return GenderModel(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
    );
  }

  // Convert to Map / JSON
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
    };
  }
}