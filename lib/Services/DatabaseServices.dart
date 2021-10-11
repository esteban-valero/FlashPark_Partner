import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('Partners');

  Future<void> createUserData(
      String name, String pasword, int phone, String uid, String email) async {
    return await profileList.doc(uid).set(
        {'name': name, 'pasword': pasword, 'Phone': phone, 'Email': email});
  }

  Future updateUserList(
      String name, String pasword, int phone, String uid, String email) async {
    return await profileList.doc(uid).update(
        {'name': name, 'Pasword': pasword, 'phone': phone, 'Email': email});
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getUserProfile() async {
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('Partners')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    return document;
  }
}
