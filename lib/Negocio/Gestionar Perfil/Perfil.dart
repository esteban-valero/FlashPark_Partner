import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Model/User.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Perfil/EditPerfil.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User user = User("");

  bool _isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Perfil",
            style: TextStyles.appPartnerTextStyle.copyWith(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.orange,
          toolbarHeight: 70,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
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

  Widget displayUserInformation(context, snapshot) {
    //return Text("data");
    final authData = snapshot.data;

    return Column(
      children: <Widget>[
        FutureBuilder(
            future: _getProfileData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _isAdmin = user.admin ?? false;
                return Container(
                  width: 350,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 130,
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Creado: ${DateFormat('MM/dd/yyyy').format(authData.metadata.creationTime)}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Table(
                          // textDirection: TextDirection.rtl,
                          //defaultVerticalAlignment: TableCellVerticalAlignment.top,
                          defaultColumnWidth: IntrinsicColumnWidth(),
                          children: [
                            TableRow(children: [
                              Text("Nombre:",
                                  style: TextStyles.appPartnerTextStyle),
                              Text(user.name,
                                  textScaleFactor: 1,
                                  style: TextStyles.appPartnerTextStyle),
                            ]),
                            TableRow(children: [
                              SizedBox(height: 15), //SizeBox Widget
                              SizedBox(height: 15), //SizeBox Widget
                            ]),
                            TableRow(children: [
                              Text("Email:",
                                  textScaleFactor: 1,
                                  style: TextStyles.appPartnerTextStyle),
                              Text(user.email,
                                  textScaleFactor: 1,
                                  style: TextStyles.appPartnerTextStyle),
                            ]),
                            TableRow(children: [
                              SizedBox(height: 15), //SizeBox Widget
                              SizedBox(height: 15), //SizeBox Widget
                            ]),
                            TableRow(children: [
                              Text("Telefono:",
                                  textScaleFactor: 1,
                                  style: TextStyles.appPartnerTextStyle),
                              Text(user.Phone,
                                  textScaleFactor: 1,
                                  style: TextStyles.appPartnerTextStyle),
                            ]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      adminFeature(),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          color: Colors.orange,
          minWidth: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditPerfil(),
              ),
            );
          },
          child: Text("Editar",
              textAlign: TextAlign.center,
              style: TextStyles.appPartnerTextStyle
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget adminFeature() {
    if (_isAdmin == true) {
      return Text("Eres administrador", style: TextStyles.appPartnerTextStyle);
    } else {
      return Container();
    }
  }

  _getProfileData() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
    print("uid:");
    print(uid);
    //print(Provider.of(context).db.collection('Partners').doc(uid).get());
    await Provider.of(context)
        .db
        .collection("Partners")
        .doc(uid)
        .get()
        .then((result) {
      user.Phone = result.data()['Phone'];
      user.admin = result.data()['admin'];
      user.name = result.data()['name'];
      user.email = result.data()['Email'];
      user.image = result.data()['image'];
    });
  }
}
