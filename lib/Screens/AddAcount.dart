import 'package:flutter/material.dart';
import 'package:hello_world_flutter/common/custom_FlashPark_Icon.dart';
import 'package:hello_world_flutter/common/custom_FlashParkhome_Icon.dart';
import 'package:hello_world_flutter/main.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/Screens/HomeFlasPark.dart';
import 'package:hello_world_flutter/Screens/EditPerfil.dart';

class AddAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Desembolsa tu dinero",
          style: TextStyles.appPartnerTextStyle
              .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: Center(
        child: MyStatefulWidget(),
      ),
    );
  }
}

enum BestTutorSite { corriente, ahorros }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  BestTutorSite _site = BestTutorSite.corriente;

  Widget build(BuildContext context) {
    final accountNumberField = TextField(
      obscureText: false,
      style: TextStyles.appPartnerTextStyle,
      decoration: InputDecoration(
          //contentPadding: EdgeInsets.fromLTRB(20.0, 5, 20.0, 15.0),
          hintText: "Ingres el numero de tu cuenta",
          labelText: "Cuenta",
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange),
          )),
    );

    final addAccountButton = Material(
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
            MaterialPageRoute(builder: (context) => HomeFlashPark()),
          );
        },
        child: Text("Registrar  Parqueadero",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return SingleChildScrollView(
      child: Container(
          width: 350,
          child: Column(
            children: <Widget>[
              CustomImageFPHome(),
              Text("Partner",
                  style: TextStyles.appPartnerTextStyle.copyWith(fontSize: 50)),
              SizedBox(height: 30),
              Text("Ingresa tu numero de cuenta",
                  style: TextStyles.appPartnerTextStyle.copyWith(fontSize: 25)),
              SizedBox(height: 30),
              accountNumberField,
              SizedBox(height: 40),
              ListTile(
                title: Text('Ahorros',
                    style:
                        TextStyles.appPartnerTextStyle.copyWith(fontSize: 25)),
                leading: Radio(
                  value: BestTutorSite.ahorros,
                  groupValue: _site,
                  onChanged: (BestTutorSite value) {
                    setState(() {
                      _site = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Corriente',
                    style:
                        TextStyles.appPartnerTextStyle.copyWith(fontSize: 25)),
                leading: Radio(
                  value: BestTutorSite.corriente,
                  groupValue: _site,
                  onChanged: (BestTutorSite value) {
                    setState(() {
                      _site = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              addAccountButton,
            ],
          )),
    );
  }
}
