class Product {
  final int id;
  final List<String> pictureList;
  final String title;
  final String prix;
  final int categoryId;
  final String description;
  final String city;
  final String postCode;
  final int userId;

  Product({
    required this.id,
    required this.pictureList,
    required this.title,
    required this.prix,
    required this.categoryId,
    required this.description,
    required this.city,
    required this.postCode,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pictureList': pictureList.join(', '),
      'title': title,
      'prix': prix,
      'categoryId': categoryId,
      'description': description,
      'city': city,
      'postCode': postCode,
      'userId': userId,
    };
  }
}
