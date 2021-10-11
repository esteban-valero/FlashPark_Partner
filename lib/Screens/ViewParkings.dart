import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Screens/Perfil.dart';
import 'package:hello_world_flutter/common/customDetailParking.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/Screens/PayOut.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class ViewParking extends StatelessWidget {
  const ViewParking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mis Parqueaderos",
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
              width: 350,
              child: ListTile(
                title: Text(
                  'Parking 1',
                  style: TextStyles.appPartnerTextStyle.copyWith(),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomDetailParking(),
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
              width: 350,
              child: ListTile(
                title: Text(
                  'Parking 2',
                  style: TextStyles.appPartnerTextStyle.copyWith(),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomDetailParking(),
                    ),
                  );
                  // Update the state of the app

                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.orange))),
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
                      builder: (context) => ProfileView(),
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
}
