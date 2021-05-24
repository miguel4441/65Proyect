import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:yachaq/app/ui/dialog/dialog_helper.dart';
import 'package:yachaq/app/ui/general/general.presenter.dart';
import 'package:yachaq/app/ui/general/general.view.dart';
import 'package:yachaq/app/ui/nav_bar/bar.dart';
import 'package:yachaq/app/utils/colors.dart';
import 'package:yachaq/app/utils/resources.dart';
import 'package:yachaq/data/rr/response/consultation_general.response.dart';
import 'package:yachaq/data/rr/response/description_general.response.dart';
import 'package:yachaq/domain/repository/consultations.repository.dart';

import 'detail/no_user_information.dart';
import 'detail/not_found_user_information.dart';
import 'detail/user_information.dart';

class GeneralPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(builder: (context) => GeneralPage());

  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> implements GeneralView {
  String code = "";
  String verifyResult = "";
  String monthValue = "Enero";
  String monthKeyValue = "01";
  List<String> monthList = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre"
  ];
  //String selectedDate;
  String selectedDateFormat;

  //String CAPTCHA_SITE_KEY = "6LfUzY4aAAAAAB_L4wPTRFfHpU_lWy6yq7sddIfm";
  //RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();
  TextEditingController _dni = TextEditingController();
  TextEditingController _captchacode = TextEditingController();
  TextEditingController dayValue = TextEditingController();
  TextEditingController yearValue = TextEditingController();
  GeneralPresenter generalPresenter;

  @override
  void initState() {
    monthValue = getMonthByKey(DateTime.now().month.toString());
    monthKeyValue = getKeyByMonth(monthValue);
    dayValue.text = DateTime.now().day < 10 ? "0" + DateTime.now().day.toString() : DateTime.now().day.toString();
    yearValue.text = (DateTime.now().year - 65).toString();

    generalPresenter = GeneralPresenter(consultationsRepository: ConsultationsRepository());
    generalPresenter.view = this;

    refreshCaptchaNumeric();

    super.initState();
    //recaptchaV2Controller.show();
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
                body: ListView(children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 200,
                            child: Image.asset(Resources.pension65),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 50)),
                        Text(
                          "Consulta si eres usuario(a)\nde Pensión 65",
                          style: TextStyle(fontSize: 17.5, color: ColorsApp.grayDark),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        TextField(
                            controller: _dni,
                            autocorrect: false,
                            enableSuggestions: false,
                            maxLength: 8,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Ingresa tu DNI",
                              prefixIcon: Image.asset(Resources.req2, scale: 2),
                              contentPadding: EdgeInsets.all(14.0),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black, width: 0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black, width: 0),
                              ),
                            )),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Ingresa tu fecha de nacimiento",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                              strutStyle: StrutStyle(height: 1.2)),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: TextField(
                                    controller: dayValue,
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    maxLength: 2,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(14.0),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        borderSide: BorderSide(color: Colors.black, width: 0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        borderSide: BorderSide(color: Colors.black, width: 0),
                                      ),
                                    )),
                                flex: 2),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.topCenter,
                                  child: DropdownButtonFormField(
                                    iconSize: 0,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(12.0),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        borderSide: BorderSide(color: Colors.black, width: 0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        borderSide: BorderSide(color: Colors.black, width: 0),
                                      ),
                                    ),
                                    value: monthValue,
                                    onChanged: (String value) {
                                      setState(() {
                                        monthValue = value;
                                        monthKeyValue = getKeyByMonth(monthValue);
                                        print(monthValue);
                                        print(monthKeyValue);
                                      });
                                    },
                                    items: monthList
                                        .map((month) => DropdownMenuItem(value: month, child: Text("$month")))
                                        .toList(),
                                  ),
                                ),
                                flex: 4),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: TextField(
                                    controller: yearValue,
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    maxLength: 4,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(14.0),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        borderSide: BorderSide(color: Colors.black, width: 0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        borderSide: BorderSide(color: Colors.black, width: 0),
                                      ),
                                    )),
                                flex: 3),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.all(2),
                                child: HBCheckCode(
                                  code: code,
                                  dotCount: 0,
                                  height: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey, // set border color
                                      width: 1), // set border width
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                )),
                            FlatButton(
                              minWidth: 30,
                              height: 30,
                              child: Image.asset(Resources.refresh, width: 30, height: 30),
                              onPressed: () {
                                setState(() {
                                  refreshCaptchaNumeric();
                                });
                              },
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        TextField(
                            controller: _captchacode,
                            autocorrect: false,
                            enableSuggestions: false,
                            maxLength: 4,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14.0),
                              hintText: "Ingresa el número captcha",
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black, width: 0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black, width: 0),
                              ),
                            )),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        Container(
                          height: 36,
                          width: 100,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            )
                          ]),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: ColorsApp.colorBoton, width: 1),
                            ),
                            textColor: Colors.white,
                            color: ColorsApp.colorBoton,
                            child: Text(
                              "Buscar",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100),
                              strutStyle: StrutStyle(height: 1.2),
                            ),
                            onPressed: () {
                              validateDni();
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 50)),
                      ],
                    ),
                  )
                ]))));
  }

  String getKeyByMonth(String month) {
    switch (month) {
      case "Enero":
        return "01";
        break;
      case "Febrero":
        return "02";
        break;
      case "Marzo":
        return "03";
        break;
      case "Abril":
        return "04";
        break;
      case "Mayo":
        return "05";
        break;
      case "Junio":
        return "06";
        break;
      case "Julio":
        return "07";
        break;
      case "Agosto":
        return "08";
        break;
      case "Septiembre":
        return "09";
        break;
      case "Octubre":
        return "10";
        break;
      case "Noviembre":
        return "11";
        break;
      case "Diciembre":
        return "12";
        break;
      default:
        return "";
        break;
    }
  }

  String getMonthByKey(String key) {
    switch (key) {
      case "1":
        return "Enero";
        break;
      case "2":
        return "Febrero";
        break;
      case "3":
        return "Marzo";
        break;
      case "4":
        return "Abril";
        break;
      case "5":
        return "Mayo";
        break;
      case "6":
        return "Junio";
        break;
      case "7":
        return "Julio";
        break;
      case "8":
        return "Agosto";
        break;
      case "9":
        return "Septiembre";
        break;
      case "10":
        return "Octubre";
        break;
      case "11":
        return "Noviembre";
        break;
      case "12":
        return "Diciembre";
        break;
      default:
        return "";
        break;
    }
  }

  refreshCaptchaNumeric() {
    code = "";
    for (var i = 0; i < 4; i++) {
      code = code + Random().nextInt(9).toString();
    }
  }

  validateDni() {
    if (_dni.text.isNotEmpty) {
      if (dayValue.text != null && dayValue.text.isNotEmpty) {
        if (monthValue != null) {
          if (yearValue.text != null && yearValue.text.isNotEmpty) {
            if (int.parse(yearValue.text) <= (DateTime.now().year - 65)) {
              selectedDateFormat = yearValue.text + monthKeyValue + dayValue.text;
              if (code == _captchacode.text) {
                generalPresenter.getUserInformation(_dni.text, selectedDateFormat);
              } else {
                _showErrorMessage("Consulta General", "Debes ingresar el código númerico correctamente.");
              }
            } else {
              _showErrorMessage("Consulta General", "Debes tener 65 a más años.");
            }
          } else {
            _showErrorMessage("Consulta General", "Ingresa un año");
          }
        } else {
          _showErrorMessage("Consulta General", "Selecciona un mes");
        }
      } else {
        _showErrorMessage("Consulta General", "Ingresa un día");
      }
    } else {
      _showErrorMessage("Consulta General", "Ingresa tu número de DNI");
    }
  }

  Future<void> _showErrorMessage(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title, strutStyle: StrutStyle(height: 1.2)),
          content: Text(message, strutStyle: StrutStyle(height: 1.2)),
          actions: <Widget>[
            CupertinoDialogAction(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  textColor: Colors.white,
                  color: ColorsApp.colorBoton,
                  child: Text(
                    "Ok",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100),
                    strutStyle: StrutStyle(height: 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )),
          ],
        );
      },
    );
  }

  @override
  getUserInformation(ConsultationGeneralResponse userInformation, DescriptionGeneralResponse descriptionResponse) {
    if (userInformation.CONDICION == "USUARIO" || userInformation.CONDICION == "POTENCIAL") {
      Navigator.push(context, UserInformationPage.route(userInformation, descriptionResponse));
    } else if (userInformation.CONDICION == "NO ENCONTRADO" || userInformation.CONDICION == "ADULTO MAYOR") {
      Navigator.push(context, NotFoundUserInformationPage.route(userInformation, descriptionResponse));
    } else {
      Navigator.push(context, NoUserInformationPage.route(userInformation, descriptionResponse));
    }
  }

  @override
  hideLoading() {
    Navigator.of(context).pop();
  }

  @override
  showLoading() {
    DialogHelper.loading(context);
  }

  @override
  onError(String message) {
    _showErrorMessage("Consulta General", message);
  }
}
