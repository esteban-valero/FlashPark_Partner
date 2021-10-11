import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class MockAuthResult extends Mock implements Future<UserCredential> {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MockFirebaseAuth _auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseUser> _user = BehaviorSubject<MockFirebaseUser>();
  AuthenticationService _repo = AuthenticationService();

  group('FirebasServices Test', () {
    when(_auth.signInWithEmailAndPassword(email: "email", password: "password"))
        .thenAnswer((_) async {
      _user.add(MockFirebaseUser());
      return MockAuthResult();
    });
    test('Sign in with email and password', () async {
      String signedIn =
          await _repo.signIn(email: "test@gmail.com", password: "123456");
      expect(signedIn, "Signed in ");
    });

    test('sign out', () {});
  });
}
