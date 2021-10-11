import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Screens/EditPerfil.dart';
import 'package:hello_world_flutter/Screens/PayOut.dart';
import 'package:hello_world_flutter/Services/FirebaseAuthServices.dart';
import 'package:hello_world_flutter/common/custom_FlashParkhome_Icon.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/Screens/HomeFlasPark.dart';
import 'package:provider/provider.dart';

class Perfil extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final String nameController = 'Daniel Esteban Valero';
  final TextEditingController phonrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final saveButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(40.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditPerfil()),
          );
        },
        child: Text("Editar",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perfil",
          style: TextStyles.appPartnerTextStyle
              .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        toolbarHeight: 70,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/Background.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Table(
                      // textDirection: TextDirection.rtl,
                      //defaultVerticalAlignment: TableCellVerticalAlignment.top,
                      defaultColumnWidth: IntrinsicColumnWidth(),
                      children: [
                        TableRow(children: [
                          Text("Nombre:",
                              style: TextStyles.appPartnerTextStyle),
                          Text("Daniel Esteban Valero",
                              textScaleFactor: 1,
                              style: TextStyles.appPartnerTextStyle),
                        ]),
                        TableRow(children: [
                          SizedBox(height: 15), //SizeBox Widget
                          SizedBox(height: 15), //SizeBox Widget
                        ]),
                        TableRow(children: [
                          Text("Email:",
                              textScaleFactor: 1,
                              style: TextStyles.appPartnerTextStyle),
                          Text("dvalero@gmail.com",
                              textScaleFactor: 1,
                              style: TextStyles.appPartnerTextStyle),
                        ]),
                        TableRow(children: [
                          SizedBox(height: 15), //SizeBox Widget
                          SizedBox(height: 15), //SizeBox Widget
                        ]),
                        TableRow(children: [
                          Text("Telefono:",
                              textScaleFactor: 1,
                              style: TextStyles.appPartnerTextStyle),
                          Text("3144429560",
                              textScaleFactor: 1,
                              style: TextStyles.appPartnerTextStyle),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  saveButton
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: new CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.orange,
                child: new Image.asset(
                  'assets/images/PeopleIcon.png',
                ),
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Perfil',
                  style: TextStyles.appPartnerTextStyle.copyWith(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Perfil(),
                    ),
                  );
                  // Update the state of the app

                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Parqueaderos',
                  style: TextStyles.appPartnerTextStyle.copyWith(),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Ayuda',
                  style: TextStyles.appPartnerTextStyle.copyWith(),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Desembolsar',
                  style: TextStyles.appPartnerTextStyle.copyWith(),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayOut(),
                    ),
                  );
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Cerrar sesión',
                  style: TextStyles.appPartnerTextStyle.copyWith(),
                ),
                onTap: () async {
                  final auth = Provider.of(context).auth;
                  await auth.signOut();
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
            ),
          ],
        ),
      ),
    );
  }

  String validatePassword(String value) {
    //print("valor $value passsword ${passwordController.text}");
    if (value.length == 0) return "La contraseña es necesaria";
    if (value != passwordController.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
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
