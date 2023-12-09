class ProductDTO {
  final int id;
  final List<String> pictureList;
  final String title;
  final int prix;
  final String category;
  final String description;
  final String date;
  final String city;
  final String postCode;
  final String username;
  final String profilPicture;

  ProductDTO({
    required this.id,
    required this.pictureList,
    required this.title,
    required this.prix,
    required this.category,
    required this.description,
    required this.date,
    required this.city,
    required this.postCode,
    required this.username,
    required this.profilPicture,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      pictureList: json['pictureList'].cast<String>(),
      title: json['title'],
      prix: json['prix'],
      category: json['category'],
      description: json['description'],
      date: json['date'],
      city: json['city'],
      postCode: json['postCode'],
      username: json['username'],
      profilPicture: json['profilPicture'],
    );
  }

}
