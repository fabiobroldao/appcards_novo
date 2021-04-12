import 'package:appcards/models/cores.dart';
import 'package:appcards/views/cad_usuario.dart';
import 'package:appcards/views/card_edit.dart';
import 'package:appcards/views/cards.dart';
import 'package:appcards/views/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: azulGrowdev,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => Login(),
        '/cards': (_) => Cards(),
        '/cardEdit': (_) => CardEdit(),
        '/CadUsuario': (_) => CadUsuario(),
      },
      //onGenerateRoute: (settings) {},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => Login());
      },
    );
  }
}
