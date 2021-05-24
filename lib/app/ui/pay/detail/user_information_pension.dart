import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:yachaq/app/ui/nav_bar/bar.dart';
import 'package:yachaq/app/utils/colors.dart';
import 'package:yachaq/app/utils/resources.dart';
import 'package:yachaq/data/rr/response/consultation_pension.response.dart';
import 'package:yachaq/data/rr/response/description.response.dart';
import 'package:url_launcher/url_launcher.dart';

class UserInformationPensionPage extends StatefulWidget {
  ConsultationPensionResponse userInfo;
  DescriptionResponse descriptionInfo;

  UserInformationPensionPage(this.userInfo, this.descriptionInfo);

  static Route<dynamic> route(ConsultationPensionResponse userInformation, DescriptionResponse descriptionInfo) =>
      MaterialPageRoute(builder: (context) => UserInformationPensionPage(userInformation, descriptionInfo));

  @override
  _UserInformationPensionPageState createState() => _UserInformationPensionPageState();
}

class _UserInformationPensionPageState extends State<UserInformationPensionPage> {
  String label = '';
  bool personaCobroShow = true;
  bool modalidadShow = false;
  bool lugarShow = false;
  bool iconoUbicacionShow = false;
  bool activeLugarPagoAgencia = false;
  String msjLugarPagoAgencia = '';
  @override
  void initState() {
    super.initState();
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.7);
    flutterTts.setLanguage('es-ES');
    flutterTts.speak(widget.userInfo.MENSAJE);
    var personaCobro = widget.userInfo.TERCERO.toString();

    if (personaCobro == null || personaCobro == "") {
      personaCobroShow = false;
    }

    if (widget.userInfo.MODALIDAD_PAGO == "Agencia Bancaria") {
      modalidadShow = true;
      msjLugarPagoAgencia = 'Cualquier Agencia del \nBanco de la Nación';
    } else if (widget.userInfo.MODALIDAD_PAGO == "Transportadora") {
      modalidadShow = true;
      activeLugarPagoAgencia = true;
      msjLugarPagoAgencia = 'Transportadora ${widget.userInfo.LUGAR_AGENCIA}';
    }

    label = widget.userInfo.FECHAPAGOLABEL;
    //final date = DateFormat("yyyy-MM").parse(widget.userInfo.PERIODO);
  }

  @override
  void dispose() {
    super.dispose();
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
              appBar: pensionBar(context),
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
                          child: Image.asset(Resources.pension65),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text("Hola, ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                            ),
                            Flexible(
                              child: Text(widget.userInfo.NOMBRES ?? "-",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                                  strutStyle: StrutStyle(height: 1.4)),
                            )
                          ],
                        ),
                        /*
                    Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                        ),
                        child: Image.asset(Resources.pension, width: 150, height: 150)),
                     */
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                        ),
                        Text(
                          "Tienes un depósito en tu cuenta de:",
                          style: TextStyle(fontSize: 18),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Container(
                          //padding: EdgeInsets.all(10),
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
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                ),
                                Text("S/. " + int.parse(widget.userInfo.MONTO).toStringAsFixed(0) ?? "-",
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                                    strutStyle: StrutStyle(height: 1.2)),
                              ]),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.arrow_right_sharp, size: 30, color: ColorsApp.colorBoton),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              TextSpan(
                                text: 'Periodo:',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Text(widget.userInfo.PERIODO ?? "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                        Visibility(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          visible: personaCobroShow,
                        ),
                        Visibility(
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.arrow_right_sharp, size: 30, color: ColorsApp.colorBoton),
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "La persona autorizada para realizar el cobro es: ${widget.userInfo.TERCERO}",
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          visible: personaCobroShow,
                        ),
                        Visibility(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20),
                            ),
                            visible: modalidadShow),
                        Visibility(
                            child: Align(
                              alignment: Alignment.center,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.arrow_right_sharp, size: 30, color: ColorsApp.colorBoton),
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Puedes cobrar en:",
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            visible: modalidadShow),
                        Visibility(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            visible: modalidadShow),
                        Visibility(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(msjLugarPagoAgencia ?? "-",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  strutStyle: StrutStyle(height: 1.2)),
                            ),
                            visible: modalidadShow),
                        Visibility(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20),
                            ),
                            visible: modalidadShow),
                        Visibility(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.arrow_right_sharp, size: 30, color: ColorsApp.colorBoton),
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Tu lugar de pago es:",
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            visible: lugarShow),
                        Visibility(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            visible: lugarShow),
                        Visibility(
                          child: Text(widget.userInfo.LUGAR_AGENCIA ?? "-",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              strutStyle: StrutStyle(height: 1.2)),
                          visible: lugarShow,
                        ),
                        Visibility(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Visibility(
                                  visible: widget.userInfo.LATITUD != null &&
                                      widget.userInfo.LONGITUD != null &&
                                      widget.userInfo.LONGITUD.isNotEmpty &&
                                      widget.userInfo.LATITUD.isNotEmpty,
                                  child: SizedBox(
                                    width: 20,
                                  )),
                              Visibility(
                                  visible: widget.userInfo.LATITUD != null &&
                                      widget.userInfo.LONGITUD != null &&
                                      widget.userInfo.LONGITUD.isNotEmpty &&
                                      widget.userInfo.LATITUD.isNotEmpty,
                                  child: Container(
                                    //padding: EdgeInsets.only(left: 20),
                                      child: GestureDetector(
                                        child: Image.asset(Resources.location, width: 40, height: 40, fit: BoxFit.contain),
                                        onTap: () {
                                          _launchURL(widget.userInfo.LATITUD, widget.userInfo.LONGITUD);
                                        },
                                      ))),
                            ],
                          ),
                          visible: iconoUbicacionShow,
                        ),
                        /*
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      visible: activeLugarPagoAgencia,
                    ),
                    Visibility(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "*" + msjLugarPagoAgencia + "*",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        visible: activeLugarPagoAgencia),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    */
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.arrow_right_sharp, size: 30, color: ColorsApp.colorBoton),
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                TextSpan(
                                  text: label,
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Text(widget.userInfo.FECHA_PAGO ?? "-",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                strutStyle: StrutStyle(height: 1.2)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40),
                        ),
                        Container(
                          //margin: EdgeInsets.only(left: 40, right: 40, top: 10),
                          padding: EdgeInsets.all(5),
                          //color: Colors.grey,
                          child: Text(
                            widget.descriptionInfo.infotipo,
                            style: TextStyle(
                              //color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                            strutStyle: StrutStyle(height: 1.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  _launchURL(latitude, longitude) async {
    var url = 'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}