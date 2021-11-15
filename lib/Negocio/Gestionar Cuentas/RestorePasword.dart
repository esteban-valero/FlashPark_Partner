import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/common/custom_FlashPark_Icon.dart';

import 'package:hello_world_flutter/utils/text_styles.dart';

class RestorePassword extends StatelessWidget {
  final GlobalKey<FormState> keyForm = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final height = MediaQuery.of(context).size.height;

    final auth = FirebaseAuth.instance;

    final emailField = TextFormField(
        controller: emailController,
        obscureText: false,
        style: TextStyles.appPartnerTextStyle,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "E-mail",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.orange),
            )),
        validator: validateEmail);

    final loginNow = TextButton(
      onPressed: () => {Navigator.pop(context)},
      child: Text("¡Inicia sesión aqui!",
          textAlign: TextAlign.center,
          style: TextStyles.appPartnerTextStyle
              .copyWith(color: Colors.grey, fontSize: 15)),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (keyForm.currentState.validate()) {
            auth.sendPasswordResetEmail(email: emailController.text.trim());
            Navigator.of(context).pop();
            keyForm.currentState.reset();
          }
        },
        child: Text("Restaurar Contraseña",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
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
              height: 300,
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
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Recupera tu contraseña',
                      style: TextStyles.appPartnerTextStyle
                          .copyWith(color: Colors.orange),
                    ),
                    SizedBox(height: 30.0),
                    emailField,
                    SizedBox(height: 20.0),
                    registerButton,
                    SizedBox(height: 10.0),
                    loginNow
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
