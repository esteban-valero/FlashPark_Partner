import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hello_world_flutter/Model/Address.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  // ignore: deprecated_member_use
  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (User user) => user?.uid,
      );

  Future<String> getCurrentUID() async {
    return (_firebaseAuth.currentUser).uid;
  }

  Future getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  // Email & Password Sign Up
  Future<String> signUp(
      String email, String password, String name, String phone) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await updateUserName(name, authResult.user);

      final ref = FirebaseStorage.instance.ref().child('PeopleIcon.png');

      var url = await ref.getDownloadURL();
      var status = await OneSignal.shared.getPermissionSubscriptionState();
      String tokenId = status.subscriptionStatus.userId;

      firestoreInstance
          .collection("Partners")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({
        "name": name,
        "Email": email,
        "Pasword": password,
        "Phone": phone,
        "UserID": FirebaseAuth.instance.currentUser.uid,
        'image': url,
        "tokenId": tokenId
      }).then((_) {
        print("Success!");
      });
      return "Signed UP";
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message);
    }
  }

  Future updateUserName(String name, User currentUser) async {
    await currentUser.updateProfile(displayName: name);
    await currentUser.reload();
  }

  // Email & Password Sign In

  Future signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  //register Parking
  Future registerParking(String nombre, String adress, String cars,
      String motos, String scooters, String bicis, Address direccion) {
    String idParking = firestoreInstance
        .collection("Partners")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("Parkings")
        .doc()
        .id;

    firestoreInstance
        .collection("Partners")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("Parkings")
        .doc(idParking)
        .set({
      "Name": nombre,
      "address": adress,
      "Car Capacity": int.parse(cars),
      "Motorcycle Capacity": int.parse(motos),
      "Scooters Capacity": int.parse(scooters),
      "Bike Capacity": int.parse(bicis),
      "IDParking": idParking,
      'Latitud': direccion.latitud,
      'Longitud': direccion.longitud
    });

    firestoreInstance.collection("Parkings").doc(idParking).set({
      "Name": nombre,
      "address": adress,
      "Car Capacity": int.parse(cars),
      "Motorcycle Capacity": int.parse(motos),
      "Scooters Capacity": int.parse(scooters),
      "Bike Capacity": int.parse(bicis),
      "IDParking": idParking,
      "IDPartner": FirebaseAuth.instance.currentUser.uid,
      'Latitud': direccion.latitud,
      'Longitud': direccion.longitud
    });
    print("Parking Register");
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }
}
