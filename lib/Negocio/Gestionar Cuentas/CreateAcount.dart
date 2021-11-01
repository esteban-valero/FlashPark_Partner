import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Negocio/HomeFlasPark.dart';
import 'package:hello_world_flutter/Negocio/HomePage.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20ayudas/TermsOfUse.dart';
import 'package:hello_world_flutter/common/custom_FlashPark_Icon.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class CreateAccount extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonrController = TextEditingController();
  final GlobalKey<FormState> keyForm = new GlobalKey();
  final bool agree = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    bool show = false;

    String validatePassword(String value) {
      //print("valor $value passsword ${passwordController.text}");
      if (value.length == 0) return "La contraseña es necesaria";
      if (value != passwordController.text) {
        return "Las contraseñas no coinciden";
      }
      return null;
    }

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

    final name = TextFormField(
        controller: nameController,
        obscureText: false,
        style: TextStyles.appPartnerTextStyle,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Nombre",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.orange),
            )),
        validator: validateName);

    final phone = TextFormField(
        controller: phonrController,
        obscureText: false,
        style: TextStyles.appPartnerTextStyle,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Télefono",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.orange),
            )),
        validator: validateMobile);

    final passwordField = TextFormField(
        controller: passwordController,
        obscureText: true,
        style: TextStyles.appPartnerTextStyle,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Contraseña",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.orange))));

    final passwordFieldConf = TextFormField(
        controller: passwordConfirmController,
        obscureText: true,
        style: TextStyles.appPartnerTextStyle,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Contraseña",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.orange))),
        validator: validatePassword);

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (keyForm.currentState.validate()) {
            final auth = Provider.of(context).auth;

            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('¡Atencion!'),
                content: const Text(
                    '¿Aceptas terminos, condiciones y politicas de privacidad?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      show = true;
                      Navigator.pop(context, 'Cancel');
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (await auth.signUp(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              nameController.text.trim(),
                              phonrController.text.trim()) ==
                          "Signed UP") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeFlashPark()));
                      } else
                        CircularProgressIndicator();
                    },
                    child: const Text('Acepto'),
                  ),
                ],
              ),
            );

            keyForm.currentState.reset();
          }
        },
        child: Text("Registrarse",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final loginNow = TextButton(
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
              height: 750,
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
                    name,
                    SizedBox(height: 20.0),
                    passwordField,
                    SizedBox(height: 20.0),
                    passwordFieldConf,
                    SizedBox(height: 20.0),
                    phone,
                    SizedBox(height: 20.0),
                    registerButton,
                    SizedBox(height: 10.0),
                    TermsOfUse(),
                    Text("¿Ya tienes una cuenta?"),
                    loginNow
                  ],
                ),
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

String validateName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "El nombre es necesario";
  } else if (!regExp.hasMatch(value)) {
    return "El nombre debe de ser a-z y A-Z";
  }
  return null;
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

String validateMobile(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "El telefono es necesario";
  } else if (!regExp.hasMatch(value)) {
    return "El telefono solo debe contener numeros";
  } else if (value.length != 10) {
    return "El numero debe tener 10 digitos";
  }
  return null;
}
