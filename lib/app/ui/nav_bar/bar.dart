import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yachaq/app/utils/resources.dart';

Widget generalBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    title: Text("Consulta General",
        style: TextStyle(color: Colors.black, fontSize: 20),
        textAlign: TextAlign.left,
        strutStyle: StrutStyle(height: 1.3)),
    backgroundColor: Colors.transparent,
    leading: Padding(
        padding: EdgeInsets.all(18.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            Resources.back,
            fit: BoxFit.contain,
          ),
        )),
  );
}

Widget pensionBar(BuildContext context) {
  return AppBar(
      centerTitle: false,
      title: Container(
        margin: EdgeInsets.only(right: 30),
        child: Text("Consulta de pago de Pensión 65",
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.left,
            strutStyle: StrutStyle(height: 1),
            maxLines: 1),
      ),
      backgroundColor: Colors.transparent,
      leading: Padding(
          padding: EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              Resources.back,
              fit: BoxFit.contain,
            ),
          )));
}

Widget requirementsBar(BuildContext context) {
  return AppBar(
      centerTitle: false,
      title:
      Text("Requisitos", style: TextStyle(color: Colors.black, fontSize: 20), strutStyle: StrutStyle(height: 1.3)),
      backgroundColor: Colors.transparent,
      leading: Padding(
          padding: EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              Resources.back,
              fit: BoxFit.contain,
            ),
          )));
}

Widget questionsBar(BuildContext context) {
  return AppBar(
      centerTitle: false,
      title: Text("Preguntas Frecuentes",
          style: TextStyle(color: Colors.black, fontSize: 20), strutStyle: StrutStyle(height: 1.3)),
      backgroundColor: Colors.transparent,
      leading: Padding(
          padding: EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              Resources.back,
              fit: BoxFit.contain,
            ),
          )));
}
