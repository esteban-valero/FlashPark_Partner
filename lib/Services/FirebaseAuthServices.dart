import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  // ignore: deprecated_member_use
  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (User user) => user?.uid,
      );

  // Email & Password Sign Up
  Future<String> signUp(
      String email, String password, String name, String phone) async {
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

  // Email & Password Sign In

  Future signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message.toString());
    }
  }

  //register Parking
  Future registerParking(String nombre, String adress, String cars,
      String motos, String scooters, String bicis) {
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

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }
}
