import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_world_flutter/Screens/CreateAcount.dart';
import 'package:hello_world_flutter/Screens/HomePage.dart';
import 'package:hello_world_flutter/Screens/HomeFlasPark.dart';
import 'package:hello_world_flutter/Services/FirebaseAuthServices.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
          title: "Travel Budget App",
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: HomeController(),
          routes: <String, WidgetBuilder>{
            '/signUp': (BuildContext context) => CreateAccount(),
            '/signIn': (BuildContext context) => Home(),
            '/home': (BuildContext context) => HomeController(),
          }),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;

          return signedIn ? HomeFlashPark() : Home();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
