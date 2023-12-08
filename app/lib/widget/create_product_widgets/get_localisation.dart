import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:markt/domain/localisation.dart';
import 'package:markt/data/localisation_api_repository.dart';
import 'package:permission_handler/permission_handler.dart';


class GetLocalisation extends StatefulWidget {

  Map<String,String> localisation;

  GetLocalisation({required this.localisation, Key? key});

  @override
  State<GetLocalisation> createState() => _GetLocalisationState();
}

class _GetLocalisationState extends State<GetLocalisation> {

  final repository = LocalisationApiRepository();
  Map<String,String> localisation = {};

  setLocalisation(String long, String lat) async {
    Localisation localisationAPI = await repository.getLocalisation(long, lat);
    widget.localisation =  {localisationAPI.ville: localisationAPI.codePostal};
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.blue,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () async {
          PermissionStatus status = await Permission.location.request();
          if (status.isDenied) {
            print('Permission denied');
          }
          else {
            Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);
            setState(() {
              var latitude = position.latitude.toString();
              var longitude = position.longitude.toString();
              print('latitude: $latitude');
              print('longitude: $longitude');
              setLocalisation(longitude, latitude);
            });
          }
        },
        child: const Text('Get localisation'),
      ),
    );
  }
}
