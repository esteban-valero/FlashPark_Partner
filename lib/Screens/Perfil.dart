import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Model/User.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  String nameController = '';
  final TextEditingController namController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Perfil",
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
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/PeopleIcon.png'),
                  ),
                ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Created: ${DateFormat('MM/dd/yyyy').format(authData.metadata.creationTime)}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        FutureBuilder(
            future: _getProfileData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                phoneController.text = user.Phone;
                namController.text = user.name;
                emailController.text = user.email;
                _isAdmin = user.admin ?? false;
                return Container(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
            _userEditBottomSheet(context);
          },
          child: Text("Editar",
              textAlign: TextAlign.center,
              style: TextStyles.appPartnerTextStyle
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  void _userEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Actualizar Perfil",
                      style: TextStyles.appPartnerTextStyle.copyWith(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.orange,
                      iconSize: 25,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: TextFormField(
                              controller: namController,
                              obscureText: false,
                              style: TextStyles.appPartnerTextStyle,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 10.0),
                                  helperText: "Nombre",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  )),
                              validator: validateName)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: TextFormField(
                                controller: phoneController,
                                obscureText: false,
                                style: TextStyles.appPartnerTextStyle,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        10.0, 10.0, 10.0, 10.0),
                                    helperText: "Teléfono",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    )),
                                validator: validateMobile))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: TextFormField(
                              controller: emailController,
                              obscureText: false,
                              style: TextStyles.appPartnerTextStyle,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 10.0),
                                  helperText: "Email",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  )),
                              validator: validateEmail)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: TextFormField(
                                controller: passwordController,
                                obscureText: false,
                                style: TextStyles.appPartnerTextStyle,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        10.0, 10.0, 10.0, 10.0),
                                    helperText: "Contraseña",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    )),
                                validator: validatePassword)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: TextFormField(
                              controller: passwordConfirmController,
                              obscureText: false,
                              style: TextStyles.appPartnerTextStyle,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 10.0),
                                  helperText: "Confirma Contraseña",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  )),
                              validator: validatePassword)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.orange,
                      minWidth: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        user.Phone = phoneController.text;
                        user.name = namController.text;
                        user.email = emailController.text;
                        setState(() {
                          phoneController.text = user.Phone;
                          namController.text = user.name;
                          emailController.text = user.email;
                        });
                        final uid =
                            await Provider.of(context).auth.getCurrentUID();
                        await Provider.of(context)
                            .db
                            .collection('Partners')
                            .doc(uid)
                            .update(user.toJson())
                            .whenComplete(() => print('Updated'))
                            .catchError(
                                (error) => print('Failed to update $error'));
                        Navigator.of(context).pop();
                      },
                      child: Text("Editar",
                          textAlign: TextAlign.center,
                          style: TextStyles.appPartnerTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget adminFeature() {
    if (_isAdmin == true) {
      return Text("You are an admin", style: TextStyles.appPartnerTextStyle);
    } else {
      return Container();
    }
  }

  _getProfileData() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
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
    });
  }

  String validatePassword(String value) {
    //print("valor $value passsword ${passwordController.text}");
    if (value.length == 0) return "La contraseña es necesaria";
    if (value != passwordController.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }
}

String validateName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "El nombre es necesario";
  } else if (!regExp.hasMatch(value)) {
    return "El nombre debe de ser a-z y A-Z";
  }
  return null;
}

String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "El correo es necesario";
  } else if (!regExp.hasMatch(value)) {
    return "Correo invalido";
  } else {
    return null;
  }
}

String validateMobile(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "El telefono es necesario";
  } else if (!regExp.hasMatch(value)) {
    return "El telefono solo debe contener numeros";
  } else if (value.length != 10) {
    return "El numero debe tener 10 digitos";
  }
  return null;
}
