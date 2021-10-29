import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Parqueaderos/ViewReservatios.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hello_world_flutter/Model/Parking.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';

class CustomDetailParking extends StatelessWidget {
  final Parking parking;
  CustomDetailParking({
    Key key,
    @required this.parking,
  }) : super(key: key);

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
            MaterialPageRoute(
                builder: (context) => ViewReservatios(parking: parking)),
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
            "Parqueaderos",
            style: TextStyles.appPartnerTextStyle.copyWith(),
          ),
          backgroundColor: Colors.orange,
          toolbarHeight: 70,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      parking.name,
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Dirección",
                      style: TextStyles.appPartnerTextStyle,
                    ),
                    Text(
                      parking.addrs,
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Capacidad Carros",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                    Text(
                      "Capacidad Motos",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    createCircularPercentIndicator(parking.carCap, 3),
                    createCircularPercentIndicator(parking.mtCap, 1),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Capacidad Bicicletas",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                    Text(
                      "Capacidad Scooters",
                      style: TextStyles.appPartnerTextStyle.copyWith(),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    createCircularPercentIndicator(parking.bkCap, 5),
                    createCircularPercentIndicator(parking.scCap, 0),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              viewReservationButton
            ],
          ),
        ),
        drawer: Menu().getDrawer(context));
  }

  dynamic createCircularPercentIndicator(int capacity, int ocupancy) {
    print(capacity);
    print(ocupancy);
    print(DateTime.now());
    var color = Colors.black;
    print(ocupancy / capacity);
    if (capacity != 0) {
      double percentage = ocupancy / capacity;
      if (percentage > 0) {
        color = Colors.green;
      }
      if (percentage > 0.25) {
        color = Colors.yellow;
      }
      if (percentage > 0.5) {
        color = Colors.orange;
      }

      if (percentage > 0.75) {
        color = Colors.red;
      }

      print(color);
      return CircularPercentIndicator(
        radius: 100.0,
        lineWidth: 10.0,
        percent: percentage,
        center: new Text((percentage * 100).toStringAsFixed(1) + '%'),
        progressColor: color,
      );
    } else {
      return CircularPercentIndicator(
        radius: 100.0,
        lineWidth: 10.0,
        percent: 0,
        center: new Text("NA"),
        progressColor: color,
      );
    }
  }
}
