class Localisation {
  final String city;
  final String postCode;

  Localisation({required this.city, required this.postCode});

  factory Localisation.fromJson(Map<String, dynamic> json) {
    return Localisation(
      city: json['address']['city'],
      postCode: json['address']['postcode'],
    );
  }
}
