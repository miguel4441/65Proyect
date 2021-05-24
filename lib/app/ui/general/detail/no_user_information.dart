import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:intl/intl.dart';
import 'package:yachaq/app/ui/dialog/dialog_helper.dart';
import 'package:yachaq/app/ui/general/detail/user_information.dart';
import 'package:yachaq/app/ui/nav_bar/bar.dart';
import 'package:yachaq/app/ui/requirements/requirements.dart';
import 'package:yachaq/app/utils/colors.dart';
import 'package:yachaq/app/utils/resources.dart';
import 'package:yachaq/data/rr/response/consultation_general.response.dart';
import "package:yachaq/app/utils/string.extension.dart";
import 'package:yachaq/data/rr/response/description_general.response.dart';
import 'package:yachaq/domain/repository/consultations.repository.dart';

import '../general.presenter.dart';
import '../general.view.dart';
import 'not_found_user_information.dart';

class NoUserInformationPage extends StatefulWidget {
  ConsultationGeneralResponse userInfo;
  DescriptionGeneralResponse descriptionResponse;

  NoUserInformationPage(this.userInfo, this.descriptionResponse);

  static Route<dynamic> route(
      ConsultationGeneralResponse userInformation, DescriptionGeneralResponse dscrptnResponse) =>
      MaterialPageRoute(builder: (context) => NoUserInformationPage(userInformation, dscrptnResponse));

  @override
  _NoUserInformationPageState createState() => _NoUserInformationPageState();
}

class _NoUserInformationPageState extends State<NoUserInformationPage> {
  bool clasificacionShow = true;
  @override
  void initState() {
    super.initState();
    if (widget.userInfo.CONDICION == 'EX-USUARIO' || widget.userInfo.CONDICION == 'EX-USUARIA') {
      clasificacionShow = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Resources.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: generalBar(context),
              body: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 40),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                            height: 58,
                            width: 222,
                            margin: EdgeInsets.only(bottom: 77),
                            child: Image.asset(Resources.pension65)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text("Hola, ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                            ),
                            Flexible(
                                child: Text(widget.userInfo.NOMBRES,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                                    strutStyle: StrutStyle(height: 1.4)))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(38.0)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(Resources.check_green, width: 55, height: 55, fit: BoxFit.contain),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5, left: 8),
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(widget.userInfo.CONDICION,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                                    strutStyle: StrutStyle(height: 1.2))
                              ]),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                        ),
                        Visibility(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Por tu clasificación socioeconómica:",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            visible: clasificacionShow),
                        Visibility(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            visible: clasificacionShow),
                        Visibility(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(widget.userInfo.CSE.isEmpty ? "-" : widget.userInfo.CSE,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    strutStyle: StrutStyle(height: 1.2))),
                            visible: clasificacionShow),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.arrow_right_sharp, size: 30, color: Colors.red),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              TextSpan(
                                text: "Tu Ubigeo es:",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Text(
                            widget.userInfo.UBIGEO.isEmpty
                                ? "-"
                                : widget.userInfo.UBIGEO +
                                " - " +
                                widget.userInfo.DEPARTAMENTO +
                                ", " +
                                widget.userInfo.PROVINCIA +
                                ", " +
                                widget.userInfo.DISTRITO,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2),
                            textAlign: TextAlign.center),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.arrow_right_sharp, size: 30, color: Colors.red),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              TextSpan(
                                text: "La fecha de vencimiento de tu clasificación socioeconómica es:",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Text(
                            widget.userInfo.FECHA_VENCIMIENTO_VIGENCIA.isEmpty
                                ? "-"
                                : customFormat(widget.userInfo.FECHA_VENCIMIENTO_VIGENCIA),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: widget.descriptionResponse.description,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40),
                        ),
                        FlatButton(
                          height: 45,
                          textColor: Colors.white,
                          color: ColorsApp.colorBoton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38.0),
                          ),
                          child: Text(
                            " Ver requisitos ",
                            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300),
                            strutStyle: StrutStyle(height: 1.2),
                          ),
                          onPressed: () {
                            Navigator.push(context, RequirementsPage.route());
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  String customFormat(String date) {
    final splitDate = date.split("-");
    final day = splitDate[0];
    final month = splitDate[1].capitalize();
    final year = (2000 + int.parse(splitDate[2])).toString();
    final month_string = DateFormat("MMMM", "es_PE").format(DateFormat("dd MMM yyyy").parse("$day $month $year"));
    final dayWeek = DateFormat("EEEE", "es_PE").format(DateFormat("dd MMM yyyy").parse("$day $month $year"));
    final resultado = day + " de " + month_string.capitalize() + " del " + year;

    return date == null ? "" : resultado;
  }
}
