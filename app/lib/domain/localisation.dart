class Localisation {
  final String ville;
  final String codePostal;

  Localisation({required this.ville, required this.codePostal});

  factory Localisation.fromJson(Map<String, dynamic> json) {
    return Localisation(
      ville: json['address']['city'],
      codePostal: json['address']['postcode'],
    );
  }
}
