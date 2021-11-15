import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Negocio/Gestionar%20ayudas/HowToUse.dart';
import 'package:hello_world_flutter/common/custom_FlashParkhome_Icon.dart';
import 'package:hello_world_flutter/utils/text_styles.dart';
import 'package:hello_world_flutter/widgets/Menu_widget.dart';
import 'package:hello_world_flutter/widgets/Provider_widget.dart';

class Help extends StatelessWidget {
  const Help({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ayuda",
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
            SizedBox(
              height: 15,
            ),
            Text("Preguntas Frecuentes",
                style: TextStyles.appPartnerTextStyle.copyWith(fontSize: 30)),
            SizedBox(
              height: 15,
            ),
            question(
                context,
                "¿Cómo editar mi perfil?",
                VideoApp(
                    "https://firebasestorage.googleapis.com/v0/b/flashpark-8dd19.appspot.com/o/Manuales%2Fver%20y%20editar%20perfil.mp4?alt=media&token=55578a5f-da3c-48f1-9010-3391461f0d0c")),
            SizedBox(
              height: 10,
            ),
            question(
                context,
                "¿Cómo agregar un parqueadero?",
                VideoApp(
                    'https://firebasestorage.googleapis.com/v0/b/flashpark-8dd19.appspot.com/o/Manuales%2FRegistrarParqueaderos.mp4?alt=media&token=c560a95a-dea3-4ed1-9887-a04ec6443d68')),
            SizedBox(
              height: 10,
            ),
            question(
                context,
                "¿Cómo ver mis parqueaderos?",
                VideoApp(
                    'https://firebasestorage.googleapis.com/v0/b/flashpark-8dd19.appspot.com/o/Manuales%2FVerParqueaderos.mp4?alt=media&token=77af32c6-ce74-4648-9202-ddf6e318a7b0')),
            SizedBox(
              height: 10,
            ),
            question(
                context,
                "¿Cómo ver las reservas?",
                VideoApp(
                    'https://firebasestorage.googleapis.com/v0/b/flashpark-8dd19.appspot.com/o/Manuales%2FRegistrarParqueaderos.mp4?alt=media&token=c560a95a-dea3-4ed1-9887-a04ec6443d68')),
          ],
        ),
      ),
    );
  }

  Material question(BuildContext context, String question, dynamic page) {
    return Material(
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
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(question,
            textAlign: TextAlign.center,
            style: TextStyles.appPartnerTextStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
