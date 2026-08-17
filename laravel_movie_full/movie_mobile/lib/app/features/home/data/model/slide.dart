class SlideModel {
  final int id;
  final String title;
  final String image;
  final String description;
  SlideModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
  factory SlideModel.fromJson(Map<String, dynamic> json) {
    return SlideModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
    );
  }
}