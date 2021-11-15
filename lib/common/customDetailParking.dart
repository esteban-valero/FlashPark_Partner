import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Model/Reserve.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Parqueaderos/ViewReservatios.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hello_world_flutter/Model/Parking.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';

class CustomDetailParking extends StatefulWidget {
  final Parking parking;
  CustomDetailParking({
    Key key,
    @required this.parking,
  }) : super(key: key);

  @override
  State<CustomDetailParking> createState() => _CustomDetailParkingState();
}

class _CustomDetailParkingState extends State<CustomDetailParking> {
  int m = 0, c = 0, s = 0, b = 0;
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
                builder: (context) => ViewReservatios(parking: widget.parking)),
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
            style: TextStyles.appPartnerTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
          toolbarHeight: 70,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: _getReservationData(widget.parking),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.parking.name,
                                  style: TextStyles.appPartnerTextStyle
                                      .copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Dirección",
                                  style: TextStyles.appPartnerTextStyle,
                                ),
                                Text(
                                  widget.parking.addrs,
                                  style: TextStyles.appPartnerTextStyle
                                      .copyWith(fontSize: 25),
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
                                  "Carros",
                                  style: TextStyles.appPartnerTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Motos",
                                  style: TextStyles.appPartnerTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                createCircularPercentIndicator(
                                    widget.parking.carCap, c),
                                createCircularPercentIndicator(
                                    widget.parking.mtCap, m),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Bicicletas",
                                  style: TextStyles.appPartnerTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Scooters",
                                  style: TextStyles.appPartnerTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                createCircularPercentIndicator(
                                    widget.parking.bkCap, b),
                                createCircularPercentIndicator(
                                    widget.parking.scCap, s),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          viewReservationButton
                        ],
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
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
        animation: true,
        radius: 150.0,
        lineWidth: 10.0,
        percent: percentage,
        center: Text(
          (percentage * 100).toStringAsFixed(0) +
              '%\n Ocupados: $ocupancy\n Disponibles: ${capacity - ocupancy}',
          textAlign: TextAlign.center,
        ),
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

  _getReservationData(Parking parking) async {
    //print(Provider.of(context).db.collection('Partners').doc(uid).get());
    print('TRY TO GET RESERVATIONS for ${parking.idParking}');
    await Provider.of(context)
        .db
        .collection("Reservations")
        .where('IDParking', isEqualTo: parking.idParking)
        .where('vehiculo', isEqualTo: 'Moto')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        m += 1;
      });
    });
    print('motos: $m');
    await Provider.of(context)
        .db
        .collection("Reservations")
        .where('IDParking', isEqualTo: parking.idParking)
        .where('vehiculo', isEqualTo: 'Bicicleta')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        b += 1;
      });
    });
    print('bici: $b');
    await Provider.of(context)
        .db
        .collection("Reservations")
        .where('IDParking', isEqualTo: parking.idParking)
        .where('vehiculo', isEqualTo: 'Carro')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        c += 1;
      });
    });
    print('carros: $c');
    await Provider.of(context)
        .db
        .collection("Reservations")
        .where('IDParking', isEqualTo: parking.idParking)
        .where('vehiculo', isEqualTo: 'Scooter')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        s += 1;
      });
    });
    print('scootters: $s');
  }
}
