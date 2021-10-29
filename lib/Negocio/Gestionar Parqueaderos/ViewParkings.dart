import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Model/Parking.dart';
import 'package:hello_world_flutter/common/customDetailParking.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';
import 'package:intl/intl.dart';

class ViewParking extends StatefulWidget {
  @override
  _ViewParkingState createState() => _ViewParkingState();
}

class _ViewParkingState extends State<ViewParking> {
  List<Parking> parkings;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Parqueaderos",
            style: TextStyles.appPartnerTextStyle.copyWith(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.orange,
          toolbarHeight: 70,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            FutureBuilder(
                future: _getParkingData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: parkings.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: ListTile(
                                trailing: Icon(Icons.keyboard_arrow_right),
                                title: Text(
                                  parkings[index].name,
                                  style:
                                      TextStyles.appPartnerTextStyle.copyWith(),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomDetailParking(
                                        parking: parkings[index],
                                      ),
                                    ),
                                  );
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
          ],
        )),
        drawer: Menu().getDrawer(context));
  }

  Widget displayUserInformation(BuildContext context, AsyncSnapshot snapshot) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _getParkingData() async {
    parkings = [];
    final uid = await Provider.of(context).auth.getCurrentUID();
    //print(Provider.of(context).db.collection('Partners').doc(uid).get());

    await Provider.of(context)
        .db
        .collection("Partners")
        .doc(uid)
        .collection("Parkings")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Parking p = Parking(
            result.data()['Bike Capacity'],
            result.data()['Car Capacity'],
            result.data()['Motorcycle Capacity'],
            result.data()['Scooters Capacity'],
            result.data()['Name'],
            result.data()['address'],
            result.data()['IDParking']);
        parkings.add(p);
      });
    });
  }
}
