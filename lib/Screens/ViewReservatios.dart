import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Screens/EditPerfil.dart';
import 'package:hello_world_flutter/Screens/PayOut.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';

class ViewReservatios extends StatelessWidget {
  const ViewReservatios({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reservas Parking 1",
          style: TextStyles.appPartnerTextStyle.copyWith(),
        ),
        backgroundColor: Colors.orange,
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 350,
              child: Row(
                children: [
                  Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
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
                      padding: const EdgeInsets.all(5.0),
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
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "Estado",
                            style: TextStyles.appPartnerTextStyle.copyWith(),
                          ),
                          Text(
                            "Nuevo",
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
}
