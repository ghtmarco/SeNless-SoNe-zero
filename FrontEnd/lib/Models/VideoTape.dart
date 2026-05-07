class VideoTape {
  final String id;
  final String title;
  final double price;
  final String description;
  final String genreId;
  final String genreName;
  final int level;
  final List<String> imageUrls;
  final DateTime? releasedDate;
  final int stockQuantity;
  final double rating;

  const VideoTape({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.genreId,
    required this.genreName,
    required this.level,
    required this.imageUrls,
    this.releasedDate,
    required this.stockQuantity,
    required this.rating,
  });

  factory VideoTape.fromJson(Map<String, dynamic> json) {
    return VideoTape(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
      description: json['description']?.toString() ?? '',
      genreId: json['genreId']?.toString() ?? '',
      genreName: json['genreName']?.toString() ?? '',
      level: int.tryParse(json['level']?.toString() ?? '0') ?? 0,
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      releasedDate: json['releasedDate'] != null
          ? DateTime.tryParse(json['releasedDate'].toString())
          : null,
      stockQuantity:
          int.tryParse(json['stockQuantity']?.toString() ?? '0') ?? 0,
      rating: double.tryParse(json['rating']?.toString() ?? '0.0') ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'genreId': genreId,
        'genreName': genreName,
        'level': level,
        'imageUrls': imageUrls,
        'releasedDate': releasedDate?.toIso8601String(),
        'stockQuantity': stockQuantity,
        'rating': rating,
      };

  VideoTape copyWith({
    String? id,
    String? title,
    double? price,
    String? description,
    String? genreId,
    String? genreName,
    int? level,
    List<String>? imageUrls,
    DateTime? releasedDate,
    int? stockQuantity,
    double? rating,
  }) =>
      VideoTape(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        genreId: genreId ?? this.genreId,
        genreName: genreName ?? this.genreName,
        level: level ?? this.level,
        imageUrls: imageUrls ?? this.imageUrls,
        releasedDate: releasedDate ?? this.releasedDate,
        stockQuantity: stockQuantity ?? this.stockQuantity,
        rating: rating ?? this.rating,
      );
}

enum VideoGenre {
  action('Action'),
  comedy('Comedy'),
  drama('Drama'),
  horror('Horror'),
  sciFi('Sci-Fi'),
  romance('Romance'),
  documentary('Documentary'),
  animation('Animation'),
  thriller('Thriller'),
  fantasy('Fantasy');

  final String displayName;
  const VideoGenre(this.displayName);
}

enum VideoLevel {
  generalAudience(0, 'G'),
  parentalGuidance(1, 'PG'),
  pg13(2, 'PG-13'),
  restricted(3, 'R'),
  mature(4, 'NC-17');

  final int value;
  final String displayName;
  const VideoLevel(this.value, this.displayName);
}
