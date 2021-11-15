import 'package:flutter/cupertino.dart';
import 'package:hello_world_flutter/Model/Address.dart';

class AppData extends ChangeNotifier {
  Address pickUpLocation, destinyLocation;

  /*Future<String> updatePickUpLocationAddress(Address pickUpAddress) async {
    pickUpLocation = pickUpAddress;
    notifyListeners();
    return "Addres SAved";
  }*/

  void updateDestinyLocationAddress(Address destinyAddress) {
    destinyLocation = destinyAddress;
    notifyListeners();
  }
}
