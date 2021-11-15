import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hello_world_flutter/Assistants/AssistantMethods.dart';
import 'package:hello_world_flutter/Model/Address.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Parqueaderos/SearchScreen.dart';
import 'package:hello_world_flutter/Negocio/HomeFlasPark.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class RegisterParking extends StatefulWidget {
  @override
  State<RegisterParking> createState() => _RegisterParkingState();
}

class _RegisterParkingState extends State<RegisterParking> {
  Address adressSelected = new Address();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController adressController = TextEditingController();

  final TextEditingController carsController = TextEditingController();

  final TextEditingController motosController = TextEditingController();

  final TextEditingController scootersController = TextEditingController();

  final TextEditingController bicisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextField(
      controller: nameController,
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nombre de tu parqueadero",
          labelText: "Nombre",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final direcctionfield = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(40.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          searchDysplaySelection(context);
        },
        child: Text(
            "Ubicacion:  ${adressSelected.placeName != null ? '\n' + adressSelected.placeName : ''}",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final carsCapacityField = TextField(
      controller: carsController,
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Capacidad de carros",
          labelText: "Capacidad Carros",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final motosCapacityField = TextField(
      controller: motosController,
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Capacidad de motos",
          labelText: "Capacidad de motos",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final scooterCapacityField = TextField(
      controller: scootersController,
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Capacidad de scooters",
          labelText: "Capacidad de scooters",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final biciCapacityField = TextField(
      controller: bicisController,
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Capacidad de bicicletas",
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
        onPressed: () async {
          final auth = Provider.of(context).auth;
          Position pos = new Position(
              latitude: adressSelected.latitud,
              longitude: adressSelected.longitud);
          String completeAdds =
              await AssistantMethods.searchCoordinatesAddress(pos, context);
          await auth.registerParking(
              nameController.text.trim(),
              completeAdds,
              carsController.text.trim(),
              motosController.text.trim(),
              scootersController.text.trim(),
              bicisController.text.trim(),
              adressSelected);
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
          title: Text(
            "Registrar Parqueadero",
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
              /*Container(
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/Background.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              loadImageButton,*/
              Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 20),
                    nameField,
                    SizedBox(height: 20),
                    direcctionfield,
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
        drawer: Menu().getDrawer(context));
  }

  void searchDysplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final Address result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Search()),
    );
    if (result != null) {
      print('Resultado');
      print(result.placeName);
      setState(() {
        adressSelected = result;
      });
    }
  }
}
