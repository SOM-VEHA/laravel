class MovieModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String? videoUrl;
  final String? trailerUrl;
  final String banner;
  final double rating;
  final String price;
  final bool isNew;
  final bool isPopular;
  final int categoryId;
  MovieModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    this.videoUrl,
    this.trailerUrl,
    required this.banner,
    required this.rating,
    required this.price,
    required this.isNew,
    required this.isPopular,
    required this.categoryId,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      videoUrl: json['video_url'] as String?,
      trailerUrl: json['trailer_url'] as String?,
      banner: json['banner'] as String,
      rating: (json['rating'] as num).toDouble(),
      price: json['price'] as String,
      isNew: json['is_new'] == 1 || json['is_new'] == true,
      isPopular: json['is_popular'] == 1 || json['is_popular'] == true,
      categoryId: json['category_id'] as int,
    );
  }
}
