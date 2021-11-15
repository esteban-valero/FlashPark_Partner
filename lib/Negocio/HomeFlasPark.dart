import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Parqueaderos/RegisterParking.dart';
import 'package:hello_world_flutter/Negocio/HomePage.dart';
import 'package:hello_world_flutter/common/custom_FlashParkhome_Icon.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class HomeFlashPark extends StatelessWidget {
  const HomeFlashPark({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerButton = Material(
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
            MaterialPageRoute(builder: (context) => RegisterParking()),
          );
        },
        child: Text("Registra Tu Parqueadero",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final logoutButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(40.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          final auth = Provider.of(context).auth;
          await auth.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        },
        child: Text("Cerrar Sesion",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bienvenido de nuevo",
            style: TextStyles.appPartnerTextStyle
                .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
          toolbarHeight: 70,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomImageFPHome(),
              Text("Partner",
                  style: TextStyles.appPartnerTextStyle.copyWith(fontSize: 50)),
              Container(
                padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "¡Empecemos! \n Inscribe tu parqueadero y empieza a crecer con nosotros ",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    registerButton,
                    SizedBox(
                      height: 50,
                    ),
                    logoutButton
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: Menu().getDrawer(context));
  }
}
