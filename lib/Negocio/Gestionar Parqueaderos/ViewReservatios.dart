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
                padding: EdgeInsets.all(50),
                child: Text(
                  parking.name,
                  style: TextStyles.appPartnerTextStyle
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
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
                              child: ListTile(
                                trailing: Icon(Icons.keyboard_arrow_right),
                                title: Text(
                                  reserves[index].estado,
                                  style:
                                      TextStyles.appPartnerTextStyle.copyWith(),
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
            Container(
              alignment: Alignment.center,
              width: 350,
              child: Row(
                children: [
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Placa",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "xxx",
                            style: TextStyles.appPartnerTextStyle
                                .copyWith(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "Horario",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "xx:xx",
                            style: TextStyles.appPartnerTextStyle
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(
                            "Estado",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "Confirmado",
                            style: TextStyles.appPartnerTextStyle
                                .copyWith(fontSize: 20, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
            ),
            Container(
              alignment: Alignment.center,
              width: 350,
              child: Row(
                children: [
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Placa",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "xxx",
                            style: TextStyles.appPartnerTextStyle
                                .copyWith(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "Horario",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "xx:xx",
                            style: TextStyles.appPartnerTextStyle
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(
                            "Estado",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "Pendiente",
                            style: TextStyles.appPartnerTextStyle
                                .copyWith(fontSize: 20, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
            ),
            Container(
              alignment: Alignment.center,
              width: 350,
              child: Row(
                children: [
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Placa",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "xxx",
                            style: TextStyles.appPartnerTextStyle
                                .copyWith(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "Horario",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "xx:xx",
                            style: TextStyles.appPartnerTextStyle
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(
                            "Estado",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "Inactivo",
                            style: TextStyles.appPartnerTextStyle.copyWith(
                                fontSize: 20, color: Colors.greenAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
            ),
          ],
        ),
      ),
    );
  }

  _getReservationData(Parking parking) async {
    reserves = [];
    //print(Provider.of(context).db.collection('Partners').doc(uid).get());
    await Provider.of(context)
        .db
        .collection("Reservations")
        .where('IDParking', '==', parking.name)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Reserve r = Reserve(
            result.data()['Estado'],
            result.data()['IDParking'],
            result.data()['IDUser'],
            result.data()['Time'],
            result.data()['vehiculo']);
        reserves.add(r);
      });
    });
  }
}
