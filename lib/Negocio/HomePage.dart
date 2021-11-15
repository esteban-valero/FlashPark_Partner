import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Cuentas/CreateAcount.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Cuentas/RestorePasword.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20ayudas/Help.dart';
import 'package:hello_world_flutter/common/custom_FlashPark_Icon.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

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
        onPressed: () async {
          if (keyForm.currentState.validate()) {
            final auth = Provider.of(context).auth;
            String response = await auth.signIn(
                emailController.text.trim(), passwordController.text.trim());
            print("REspuesta $response");
            if (response != "Signed in") {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: showError(response),
                      actions: [
                        FlatButton(
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            } else
              Navigator.of(context).pushReplacementNamed('/home');
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final forgotPassword = TextButton(
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
    );

    final createAccount = TextButton(
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
                    Text("¿Necesitas ayuda?"),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Help(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.help,
                          color: Colors.orange,
                        )),
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

Widget showError(String response) {
  switch (response) {
    case '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.':
      return Text("Nombre de usuario o contraseña incorrectos");
      break;
    default:
      return Text("Nombre de usuario o contraseña incorrectos");
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
