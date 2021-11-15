import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Model/Parking.dart';
import 'package:hello_world_flutter/Model/Reserve.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class ViewReservatios extends StatefulWidget {
  Parking parking;
  ViewReservatios({Key key, @required this.parking}) : super(key: key);

  @override
  _ViewReservatios createState() => _ViewReservatios();
}

class _ViewReservatios extends State<ViewReservatios> {
  var color;
  List<Reserve> reserves = [];
  @override
  Widget build(BuildContext context) {
    Parking parking = widget.parking;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reservas",
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
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  parking.name,
                  style: TextStyles.appPartnerTextStyle
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  parking.addrs,
                  style: TextStyles.appPartnerTextStyle.copyWith(
                    fontSize: 20,
                  ),
                )),
            FutureBuilder(
                future: _getReservationData(parking),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: reserves.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Dismissible(
                                key: Key(reserves[index].reserID),
                                background: Container(
                                  color: Colors.green,
                                  child: Icon(Icons.check),
                                ),
                                secondaryBackground: Container(
                                  color: Colors.red,
                                  child: Icon(Icons.cancel),
                                ),
                                onDismissed: (D) async {
                                  if (D == DismissDirection.endToStart) {
                                    print("Cambiando a terminado");
                                    reserves[index].estado = 'Terminado';
                                    await Provider.of(context)
                                        .db
                                        .collection('Reservations')
                                        .doc(reserves[index].reserID.trim())
                                        .update(reserves[index].toJson())
                                        .whenComplete(() => setState(() {}))
                                        .catchError((error) =>
                                            print('Failed to update $error'));
                                  }
                                  if (D == DismissDirection.startToEnd) {
                                    reserves[index].estado = 'En curso';
                                    await Provider.of(context)
                                        .db
                                        .collection('Reservations')
                                        .doc(reserves[index].reserID.trim())
                                        .update(reserves[index].toJson())
                                        .whenComplete(() => setState(() {}))
                                        .catchError((error) =>
                                            print('Failed to update $error'));
                                  }
                                },
                                child: ListTile(
                                  trailing: Icon(
                                    reserves[index].vehiculo == 'Carro'
                                        ? Icons.car_repair
                                        : reserves[index].vehiculo == 'Moto'
                                            ? Icons.motorcycle
                                            : reserves[index].vehiculo ==
                                                    'Bicicleta'
                                                ? Icons.pedal_bike
                                                : Icons.electric_scooter,
                                    color: reserves[index].estado == 'nueva'
                                        ? Colors.orangeAccent
                                        : reserves[index].estado == 'En curso'
                                            ? Colors.green
                                            : Colors.red,
                                  ),
                                  subtitle: Text(
                                    " ${reserves[index].time}  / ${reserves[index].hora} ",
                                    style: TextStyles.appPartnerTextStyle
                                        .copyWith(),
                                    textAlign: TextAlign.center,
                                  ),
                                  title: Text(
                                    " ${reserves[index].placa} ",
                                    style: TextStyles.appPartnerTextStyle
                                        .copyWith(),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomDetailParking(
                                        parking: parkings[index],
                                      ),
                                    ),
                                  );*/
                                  },
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.orange))),
                            );
                          },
                        ));
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }

  _getReservationData(Parking parking) async {
    reserves = [];
    //print(Provider.of(context).db.collection('Partners').doc(uid).get());
    print('TRY TO GET RESERVATIONS for ${parking.idParking}');
    await Provider.of(context)
        .db
        .collection("Reservations")
        .where('IDParking', isEqualTo: parking.idParking)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Reserve r = Reserve(
            result.data()['Estado'],
            result.data()['IDParking'],
            result.data()['IDUser'],
            result.data()['Time'],
            result.data()['vehiculo'],
            result.data()['Hora'],
            result.data()['placa'],
            result.data()['reserID']);
        print('placa');
        print(r.placa);
        reserves.add(r);
      });
    });
    print('TRY TO GET RESERVATIONS');
  }
}
