import 'package:flutter/material.dart';

import 'package:hello_world_flutter/Screens/ViewReservatios.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';

class CustomDetailParking extends StatelessWidget {
  const CustomDetailParking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewReservationButton = Material(
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
            MaterialPageRoute(builder: (context) => ViewReservatios()),
          );
        },
        child: Text("Ver Reservas",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Parking 1",
            style: TextStyles.appPartnerTextStyle.copyWith(),
          ),
          backgroundColor: Colors.orange,
          toolbarHeight: 100,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 350,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Nombre",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                    Text(
                      "Parking 1",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Direccion",
                      style: TextStyles.appPartnerTextStyle,
                    ),
                    Text(
                      "Carrera x Calle X",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.orange))),
              ),
              Container(
                alignment: Alignment.center,
                width: 350,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Capacidad Carros",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                    Text(
                      "10/20",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.orange))),
              ),
              Container(
                alignment: Alignment.center,
                width: 350,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Capacidad Motos",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                    Text(
                      "10/20",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.orange))),
              ),
              Container(
                alignment: Alignment.center,
                width: 350,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Capacidad Bicicletas",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                    Text(
                      "10/20",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.orange))),
              ),
              Container(
                alignment: Alignment.center,
                width: 350,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Capacidad Scooters",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                    Text(
                      "10/20",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.orange))),
              ),
              SizedBox(
                height: 30,
              ),
              viewReservationButton
            ],
          ),
        ),
        drawer: Menu().getDrawer(context));
  }
}
