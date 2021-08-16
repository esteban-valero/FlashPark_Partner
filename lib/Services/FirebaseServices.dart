import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world_flutter/Screens/HomePage.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final firestoreInstance = FirebaseFirestore.instance;
  var fuser = FirebaseAuth.instance.currentUser;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in ";
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message);
    }
  }

  Future<String> signUp(
      {String email, String password, String name, String phone}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      firestoreInstance
          .collection("Partners")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({
        "name": name,
        "Email": email,
        "Pasword": password,
        "Phone": phone
      }).then((_) {
        print("Success!");
      });
      return "Signed UP";
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message);
    }
  }

  Future<Widget> signOut() async {
    await _firebaseAuth.signOut();
    return Home();
  }

  void registerParking(String nombre, String adress, String cars, String motos,
      String scooters, String bicis) {
    firestoreInstance
        .collection("Partners")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("Parkings")
        .doc()
        .set({
      "Name": nombre,
      "address": adress,
      "Cart Capacity": cars,
      "Motorcycle Capacity": motos,
      "Scooters Capacity": scooters,
      "Bike Capacity": bicis
    });
    print("Parking Register");
  }
}
