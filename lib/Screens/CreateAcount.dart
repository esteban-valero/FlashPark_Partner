import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Services/AuthenticationService.dart';
import 'package:hello_world_flutter/common/custom_FlashPark_Icon.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';

class CreateAccount extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final name = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nombre",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );
    final phone = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Télefono",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );
    final passwordField = TextField(
        controller: passwordController,
        obscureText: true,
        style: TextStyles.appPartnerTextStyle,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.orange))));

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          context.read<AuthenticationService>().signUp(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
        },
        child: Text("Registrarse",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final loginNow = TextButton(
      child: TextButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          )
        },
        child: Text("¡Inicia sesión aqui!",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.grey, fontSize: 15)),
      ),
    );

    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/Background.jpg",
          height: height,
          fit: BoxFit.fill,
        ),
        CustomImageFP(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              height: 500,
              width: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 250, left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30.0),
                  emailField,
                  SizedBox(height: 20.0),
                  name,
                  SizedBox(height: 20.0),
                  passwordField,
                  SizedBox(height: 20.0),
                  phone,
                  SizedBox(height: 20.0),
                  registerButton,
                  SizedBox(height: 20.0),
                  Text("¿Ya tienes una cuenta?"),
                  loginNow
                ],
              ),
            ),
          ),
        ),
      ],
    );
    // ignore: todo
    // TODO: implement build
  }
}
