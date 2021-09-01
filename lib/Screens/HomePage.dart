import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Screens/CreateAcount.dart';
import 'package:hello_world_flutter/common/custom_FlashPark_Icon.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/Screens/RestorePasword.dart';
import 'package:provider/provider.dart';
import 'package:hello_world_flutter/Services/FirebaseServices.dart';

class Home extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> keyForm = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final emailField = TextFormField(
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
        validator: validateEmail);
    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.orange))),
      validator: validatePassword,
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(40.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (keyForm.currentState.validate()) {
            //print(emailController.text.trim());
            //print(passwordController.text.trim());
            context.read()<AuthenticationService>().signIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim());
            keyForm.currentState.reset();
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final forgotPassword = TextButton(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RestorePassword()),
          );
        },
        child: Text("¿Olvidaste tu contraseña?",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.grey, fontSize: 15)),
      ),
    );

    final createAccount = TextButton(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateAccount()),
          );
        },
        child: Text("Crea tu cuenta",
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
              height: 450,
              width: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 250, left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: new Form(
                key: keyForm,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    emailField,
                    SizedBox(height: 20.0),
                    passwordField,
                    SizedBox(
                      height: 20.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    forgotPassword,
                    Text("¿No eres miembro?"),
                    createAccount,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "El correo es necesario";
  } else if (!regExp.hasMatch(value)) {
    return "Correo invalido";
  } else {
    return null;
  }
}

String validatePassword(String value) {
  //print("valor $value passsword ${passwordController.text}");
  if (value.length == 0) return "La contraseña es necesaria";
  return null;
}
