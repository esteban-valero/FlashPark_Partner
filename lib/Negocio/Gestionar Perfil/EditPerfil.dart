import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Model/User.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Cuentas/CreateAcount.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Cuentas/RestorePasword.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Perfil/Perfil.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20Perfil/PickImage.dart';
import 'package:hello_world_flutter/Negocio/HomeFlasPark.dart';
import 'package:hello_world_flutter/Negocio/HomePage.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class EditPerfil extends StatefulWidget {
  EditPerfil({Key key}) : super(key: key);

  @override
  _EditPerfilState createState() => _EditPerfilState();
}

class _EditPerfilState extends State<EditPerfil> {
  User user = new User("");
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> keyFor = new GlobalKey();
  bool showPassword = false;

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
      user.image = result.data()['image'];
      user.pasword = result.data()['Pasword'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar Perfil",
          style: TextStyles.appPartnerTextStyle.copyWith(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        toolbarHeight: 70,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: FutureBuilder(
            future: _getProfileData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                emailController.text = user.email;
                nameController.text = user.name;
                phoneController.text = user.Phone;
                passwordController.text = user.pasword;
                passwordConfirmController.text = user.pasword;
                return ListView(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
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
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.orange,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ImageCapture(),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Form(
                        key: keyFor,
                        child: Column(
                          children: [
                            buildTextField("Nombre", user.name, false,
                                nameController, validateName),
                            buildTextField("E-mail", user.email, false,
                                emailController, validateEmail),
                            buildTextField("Télefono", user.Phone, false,
                                phoneController, validateMobile),
                            buildTextField("Contraseña", user.pasword, true,
                                passwordController, validatePassword),
                            buildTextField(
                                "Confirmar Contraseña",
                                user.pasword,
                                true,
                                passwordConfirmController,
                                validatePassword),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlineButton(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancelar",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if (keyFor.currentState.validate()) {
                              user.name = nameController.text;
                              user.email = emailController.text;
                              user.Phone = phoneController.text;
                              user.pasword = passwordController.text;

                              final uid = await Provider.of(context)
                                  .auth
                                  .getCurrentUID();
                              await Provider.of(context)
                                  .db
                                  .collection('Partners')
                                  .doc(uid)
                                  .update(user.toJson())
                                  .whenComplete(
                                      () => Navigator.of(context).pop())
                                  .catchError((error) =>
                                      print('Failed to update $error'));

                              keyFor.currentState.reset();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileView(),
                                ),
                              );
                            }
                          },
                          color: Colors.orange,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Guardar",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }),

        /**/
      ),
    );
  }

  Widget buildTextField(
      String labelText,
      String placeholder,
      bool isPasswordTextField,
      TextEditingController controller,
      String Function(String) validator) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPasswordTextField ? !showPassword : false,
        style: TextStyles.appPartnerTextStyle,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        validator: validator,
      ),
    );
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

  String validatePassword(String value) {
    //print("valor $value passsword ${passwordController.text}");
    if (value.length == 0) return "La contraseña es necesaria";
    if (value != passwordController.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }
}
