import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:yachaq/app/ui/nav_bar/bar.dart';
import 'package:yachaq/app/ui/requirements/requirements.dart';
import 'package:yachaq/app/utils/colors.dart';
import 'package:yachaq/app/utils/resources.dart';
import 'package:yachaq/data/rr/response/consultation_pension.response.dart';
import 'package:yachaq/data/rr/response/description.response.dart';
import 'package:url_launcher/url_launcher.dart';

class NotFoundUserInformationPensionPage extends StatefulWidget {
  ConsultationPensionResponse userInfo;
  DescriptionResponse descriptionInfo;

  NotFoundUserInformationPensionPage(this.userInfo, this.descriptionInfo);

  static Route<dynamic> route(ConsultationPensionResponse userInformation, DescriptionResponse descriptionResponse) =>
      MaterialPageRoute(builder: (context) => NotFoundUserInformationPensionPage(userInformation, descriptionResponse));

  @override
  _NotFoundUserInformationPensionPageState createState() => _NotFoundUserInformationPensionPageState();
}

class _NotFoundUserInformationPensionPageState extends State<NotFoundUserInformationPensionPage> {
  @override
  void initState() {
    super.initState();
    //final date = DateFormat("yyyy-MM").parse(widget.userInfo.PERIODO);
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
                          width: 222,
                          height: 58,
                          margin: EdgeInsets.only(bottom: 77),
                          child: Image.asset(Resources.pension65),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text("DNI ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                              ),
                              Flexible(
                                  child: Text("NO encontrado",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                       ))
                            ],
                          ),
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
                              Image.asset(Resources.close_red, width: 55, height: 55, fit: BoxFit.contain),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 2),
                                ),
                                Text("USUARIO(a)",
                                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w300),
                                    strutStyle: StrutStyle(height: 1.2)),
                                Text("no encontrado",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                                    strutStyle: StrutStyle(height: 1.2)),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                ),
                              ]),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40),
                        ),
                        Text("No cumples con los requisitos de ingreso a Pensión 65",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                            strutStyle: StrutStyle(height: 1.2),
                            textAlign: TextAlign.center),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Flexible(
                            child: HtmlView(
                              data:
                              "<h3>Consulta tu clasificación socieconómica aquí<b><a href=https://bit.ly/3rz7OKV target=_blank>https://bit.ly/3rz7OKV</a></b></h3>",
                              scrollable: false,
                            ),
                          )
                        ]),
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

  _launchURL(latitude, longitude) async {
    var url = 'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

