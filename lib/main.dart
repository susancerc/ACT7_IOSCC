import 'package:flutter/material.dart';
import 'package:susan/route_generator.dart';

void main() => runApp(SusiApp());

class SusiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruta',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFDFCCC8)),
      initialRoute: "/",
      home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    ); //fin de return
  } //fin widget
} //fin clase SusiApp

class Pag1 extends StatelessWidget {
  String _params = "holaaa desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Pag1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('inicio sus'),
        backgroundColor: Colors.brown[400],
      ),// fin del appbar
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Siguiente Pagina",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),// fin del textstyle
            ),// fin del text
            color: Colors.white,
            onPressed: () {
              _openPag2(context);
            },// fin onpressed
          ),// gin material button
        ),//// fin container
      ),// fin body
    );// fin scaffold
  } //fin de widget pag 1
  void _openPag2(BuildContext context) async {
    String _datoRetornadoDePag2;
    await Navigator.of(context)
        .pushNamed(
      "/segundaPag",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  } //fin pag2
} //clase pag1
