class GalleryImage {
  const GalleryImage({
    required this.id,
    required this.tags,
    required this.user,
    required this.pageURL,
    required this.webformatURL,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.likes,
  });

  final int id;
  final String tags;
  final String user;
  final String pageURL;
  final String webformatURL;
  final String largeImageURL;
  final int imageWidth;
  final int imageHeight;
  final int likes;

  factory GalleryImage.fromJson(Map<String, dynamic> json) {
    return GalleryImage(
      id: json['id'] as int,
      tags: json['tags'] as String,
      user: json['user'] as String,
      pageURL: json['pageURL'] as String,
      webformatURL: json['webformatURL'] as String,
      largeImageURL: json['largeImageURL'] as String,
      imageWidth: json['imageWidth'] as int,
      imageHeight: json['imageHeight'] as int,
      likes: json['likes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tags': tags,
      'user': user,
      'pageURL': pageURL,
      'webformatURL': webformatURL,
      'largeImageURL': largeImageURL,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'likes': likes,
    };
  }

  @override
  bool operator ==(Object other) {
    return other is GalleryImage &&
        other.id == id &&
        other.tags == tags &&
        other.user == user &&
        other.pageURL == pageURL &&
        other.webformatURL == webformatURL &&
        other.largeImageURL == largeImageURL &&
        other.imageWidth == imageWidth &&
        other.imageHeight == imageHeight &&
        other.likes == likes;
  }

  @override
  int get hashCode => Object.hash(
    id,
    tags,
    user,
    pageURL,
    webformatURL,
    largeImageURL,
    imageWidth,
    imageHeight,
    likes,
  );
}
