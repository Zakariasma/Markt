class Category {
  final int id;
  final String category_name;
  final String image;

  Category({required this.id, required this.category_name, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      category_name: json['category_name'],
      image: json['image'],
    );
  }
}
