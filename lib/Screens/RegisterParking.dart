import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Services/AuthenticationService.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/Screens/HomeFlasPark.dart';
import 'package:hello_world_flutter/Screens/EditPerfil.dart';
import 'package:hello_world_flutter/Screens/PayOut.dart';
import 'package:provider/provider.dart';

class RegisterParking extends StatelessWidget {
  const RegisterParking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameField = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ingrese el nombre de su parqueadero",
          labelText: "Nombre",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final direccionField = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ingrese la dirección de su parqueadero",
          labelText: "Dirección",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final carsCapacityField = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ingrese la capacidad de carros de su parqueadero",
          labelText: "Capacidad Carros",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final motosCapacityField = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ingrese la capacidad de motos de su parqueadero",
          labelText: "Capacidad de motos",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final scooterCapacityField = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ingrese la capacidad de scooters de su parqueadero",
          labelText: "Capacidad de scooters",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final biciCapacityField = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ingrese la capacidad de bicicletas de su parqueadero",
          labelText: "Capacidad de bicicletas",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final registerButton = Material(
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
            MaterialPageRoute(builder: (context) => HomeFlashPark()),
          );
        },
        child: Text("Registrar  Parqueadero",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final loadImageButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(40.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeFlashPark()),
          );
        },
        child: Text("Cargar Imagen",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: new CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.orange,
          child: new Image.asset(
            'assets/images/PeopleIcon.png',
          ),
        ),
        backgroundColor: Colors.orange,
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/Background.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            loadImageButton,
            Container(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 20),
                  nameField,
                  SizedBox(height: 20),
                  direccionField,
                  SizedBox(height: 20),
                  carsCapacityField,
                  SizedBox(height: 20),
                  motosCapacityField,
                  SizedBox(height: 20),
                  scooterCapacityField,
                  SizedBox(height: 20),
                  biciCapacityField,
                  SizedBox(height: 20),
                  registerButton,
                  SizedBox(height: 20),
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
                      builder: (context) => EditPerfil(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayOut(),
                    ),
                  );
                  // Update the state of the app
                  // ...
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
                onTap: () {
                  context.read<AuthenticationService>().signOut();
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
}
