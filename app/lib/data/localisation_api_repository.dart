import 'package:markt/domain/localisation.dart';
import 'package:markt/provider/geocode_api.dart';

class LocalisationApiRepository {
  final geoCodeApiProvider = GeoCodeApi();

  Future<Localisation> getLocalisation(String long, String lat) => geoCodeApiProvider.fetchLocalisation(long, lat);
}
