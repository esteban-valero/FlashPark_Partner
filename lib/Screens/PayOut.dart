import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Screens/AddAcount.dart';
import 'package:hello_world_flutter/Screens/Perfil.dart';
import 'package:hello_world_flutter/common/custom_FlashParkhome_Icon.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/Screens/HomeFlasPark.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class PayOut extends StatelessWidget {
  const PayOut({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
    var items = [
      'XXXXXXXXXX',
      'YYYYYYYYYY',
      'ZZZZZZZZZZ',
    ];
    var hinttext = "";

    final payButton = Material(
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
        child: Text("Desembolsar",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final addAcountButton = Material(
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
            MaterialPageRoute(builder: (context) => AddAccount()),
          );
        },
        child: Text("Agregar Cuenta",
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Desembolsa tu dinero",
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
                      "Tu saldo",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "100000",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Seleccione la cuenta a desembolsar",
                      style:
                          TextStyles.appPartnerTextStyle.copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: new Column(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                    child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    suffixIcon: PopupMenuButton<String>(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onSelected: (String value) {
                                        _controller.text = value;
                                        hinttext = value;
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return items.map<PopupMenuItem<String>>(
                                            (String value) {
                                          return new PopupMenuItem(
                                              child: new Text(value),
                                              value: value);
                                        }).toList();
                                      },
                                    ),
                                    hintText: hinttext,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    payButton,
                    SizedBox(
                      height: 20,
                    ),
                    Text("¿Quieres registrar una cuenta?"),
                    addAcountButton.child,
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: Menu().getDrawer(context));
  }
}
