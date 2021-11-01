import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world_flutter/Model/User.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Parqueaderos/ViewParkings.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20ayudas/Help.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Perfil/Perfil.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Parqueaderos/RegisterParking.dart';
import 'package:hello_world_flutter/Negocio/HomePage.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class Menu {
  dynamic getDrawer(BuildContext context) {
    User user = new User("");

    _getProfileData() async {
      final uid = await Provider.of(context).auth.getCurrentUID();
      print(Provider.of(context).db.collection('Partners').doc(uid).get());
      await Provider.of(context)
          .db
          .collection("Partners")
          .doc(uid)
          .get()
          .then((result) {
        user.image = result.data()['image'];
      });
    }

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: FutureBuilder(
          future: _getProfileData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: Container(
                      width: 130,
                      height: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                user.image,
                              ))),
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
                        border:
                            Border(bottom: BorderSide(color: Colors.orange))),
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
                        border:
                            Border(bottom: BorderSide(color: Colors.orange))),
                  ),
                  Container(
                    child: ListTile(
                      title: Text(
                        'Registrar Parqueadero',
                        style: TextStyles.appPartnerTextStyle.copyWith(),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterParking(),
                          ),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.orange))),
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
                            builder: (context) => Help(),
                          ),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.orange))),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.orange))),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
