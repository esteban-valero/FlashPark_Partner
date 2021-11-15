import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Services/FirebaseAuthServices.dart';
import 'package:hello_world_flutter/widgets/appData.dart';

class Provider extends InheritedWidget {
  final AuthService auth;
  final db;
  final AppData appData;

  Provider({Key key, Widget child, this.auth, this.db, this.appData})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context, {bool listen}) =>
      context.dependOnInheritedWidgetOfExactType<Provider>();
}
