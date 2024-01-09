class ImageWithTitle {
  final String image;
  final String title;

  ImageWithTitle({
    required this.image,
    required this.title,
  });

  factory ImageWithTitle.fromJson(Map<String, dynamic> json) {
    return ImageWithTitle(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
    };
  }
}
