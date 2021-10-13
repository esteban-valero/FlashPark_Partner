import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Model/Parking.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';
import 'package:intl/intl.dart';

class ViewParking extends StatefulWidget {
  @override
  _ViewParkingState createState() => _ViewParkingState();
}

class _ViewParkingState extends State<ViewParking> {
  List<Parking> parkings = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Parqueaderos",
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
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    FutureBuilder(
                      future: Provider.of(context).auth.getCurrentUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return displayUserInformation(context, snapshot);
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: Menu().getDrawer(context));
  }

  Widget displayUserInformation(BuildContext context, AsyncSnapshot snapshot) {
    final authData = snapshot.data;
    return Column(
      children: <Widget>[
        FutureBuilder(
            future: _getParkingData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  height: 100,
                  child: ListView.builder(
                    itemCount: parkings.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          parkings[index].name,
                          style: TextStyles.appPartnerTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          //Go to the next screen with Navigator.push
                        },
                      );
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _getParkingData() async {
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
          result.data()['Cart Capacity'],
          result.data()['Motorcycle Capacity'],
          result.data()['Scooters Capacity'],
          result.data()['Name'],
          result.data()['address'],
        );
        parkings.add(p);
      });
    });
  }
}
