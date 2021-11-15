import 'package:hello_world_flutter/Assistants/RequestAssistant.dart';
import 'package:hello_world_flutter/Model/Address.dart';
import 'package:hello_world_flutter/Services/ConfigMaps.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AssistantMethods {
  static Future<String> searchCoordinatesAddress(
      Position position, context) async {
    String placeAddresss = "";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";
    var response = await RequestAssistant.getRequest(url);
    if (response != "failed") {
      placeAddresss = response["results"][0]["formatted_address"];
      //st1 = response["results"][0]["address_components"][0]["long_name"];
      //st2 = response["results"][0]["address_components"][1]["long_name"];
      //st3 = response["results"][0]["address_components"][2]["long_name"];
      //st4 = response["results"][0]["address_components"][3]["long_name"];
      //placeAddresss = st1 + ", " + st2 + ", " + st3 + ", " + st4;
      Address userPickUPAdress = new Address();
      userPickUPAdress.longitud = position.longitude;
      userPickUPAdress.latitud = position.latitude;
      userPickUPAdress.placeName = placeAddresss;
      /*await Provider.of(context, listen: false)
          .appData
          .updatePickUpLocationAddress(userPickUPAdress);*/
    }
    return placeAddresss;
  }

  void obtainDirectionsDetails(
      LatLng initialPosition, LatLng finalposition) async {
    String directionURL =
        'https://maps.googleapis.com/maps/api/directions/json?origin${initialPosition.latitude},${initialPosition.longitude}=&destination=${finalposition.longitude},${finalposition.latitude}&key=$mapKey';
    var res = await RequestAssistant.getRequest(directionURL);
    if (res == "failed") {
      return;
    }
  }

  static void getCurrentOnlineReservation() async {}
}
