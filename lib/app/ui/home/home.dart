import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yachaq/app/ui/general/general.dart';

import 'package:yachaq/app/ui/pay/pension_pay.dart';
import 'package:yachaq/app/ui/questions/questions.dart';
import 'package:yachaq/app/ui/requirements/requirements.dart';
import 'package:yachaq/app/utils/colors.dart';
 
import 'package:yachaq/app/utils/resources.dart';


class HomePage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(builder: (context) => HomePage());

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Resources.bg),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(38.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          child: Image.asset(Resources.pension65),
                          margin: EdgeInsets.only(bottom: 30),
                        ),
                        Container(
                          width: 200,
                          child: Image.asset(Resources.midis),
                          margin: EdgeInsets.only(bottom: 100),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorsApp.colorBoton,
                                borderRadius: BorderRadius.all(Radius.circular(38.5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  )
                                ]),
                            child: Center(
                              child: Text("Consulta General",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
                                  strutStyle: StrutStyle(height: 1.2)),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, GeneralPage.route());
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        GestureDetector(
                          child: Container(
                            height: 55,
                            //padding: EdgeInsets.only(left: 80, right: 80),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorsApp.colorBoton,
                                borderRadius: BorderRadius.all(Radius.circular(38.5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  )
                                ]),
                            child: Center(
                              child: Text("Consulta de pago\nde Pensión 65",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
                                  strutStyle: StrutStyle(height: 1.5)),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, PensionPage.route());
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        GestureDetector(
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorsApp.colorBoton,
                                  borderRadius: BorderRadius.all(Radius.circular(38.5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    )
                                  ]),
                              child: Center(
                                child: Text(
                                  "Requisitos",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
                                  strutStyle: StrutStyle(height: 1.2),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, RequirementsPage.route());
                            }),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        GestureDetector(
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorsApp.colorBoton,
                              borderRadius: BorderRadius.all(Radius.circular(38.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Preguntas Frecuentes",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
                                strutStyle: StrutStyle(
                                  height: 1.2,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, QuestionPage.route());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

