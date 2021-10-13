import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world_flutter/Screens/Ayuda.dart';
import 'package:hello_world_flutter/Screens/PayOut.dart';
import 'package:hello_world_flutter/Screens/Perfil.dart';
import 'package:hello_world_flutter/Screens/ViewParkings.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class Menu {
  dynamic getDrawer(BuildContext context) {
    return Drawer(
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
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileView(),
                  ),
                );
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
                'Mis Parqueaderos',
                style: TextStyles.appPartnerTextStyle.copyWith(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewParking(),
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
                'Desembolsar',
                style: TextStyles.appPartnerTextStyle.copyWith(),
              ),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PayOut(),
                  ),
                );
                // Then close the drawer
                //Navigator.pop(context);
              },
              // Update the state of the app
              // ...
              // Then close the drawer
              //Navigator.pop(context);
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoApp(),
                  ),
                );
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
    );
  }
}