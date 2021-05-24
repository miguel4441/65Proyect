import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yachaq/app/ui/nav_bar/bar.dart';
import 'package:yachaq/app/ui/requirements/requirements.presenter.dart';
import 'package:yachaq/app/ui/requirements/requirements.view.dart';
import 'package:yachaq/app/utils/colors.dart';
import 'package:yachaq/app/utils/resources.dart';
import 'package:yachaq/data/rr/response/requirements.response.dart';
import 'package:yachaq/domain/repository/requirements.repository.dart';

class RequirementsPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(builder: (context) => RequirementsPage());

  @override
  _RequirementsPageState createState() => _RequirementsPageState();
}

class _RequirementsPageState extends State<RequirementsPage> implements RequirementsView {
  List<RequirementsResponse> requirementsList = [];
  RequirementsPresenter _requirementsPresenter;

  @override
  void initState() {
    super.initState();

    _requirementsPresenter = RequirementsPresenter(requirementsRepository: RequirementsRepository());
    _requirementsPresenter.view = this;
    _requirementsPresenter.getRequirements();
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
            appBar: requirementsBar(context),
            body: Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 0, top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 200,
                      child: Image.asset(Resources.pension65),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 50)),
                  Text(
                    "Requisitos para acceder al Programa\nNacional de Asistencia Solidaria Pensión 65",
                    style: TextStyle(fontSize: 17.5, color: ColorsApp.grayDark),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: requirementsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 20.0, left: 20.0),
                                  //height: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                                   CircleAvatar(
                                        backgroundColor: (index == 4) ? Colors.white : ColorsApp.colorBoton,
                                        foregroundColor: Colors.white,
                                        radius: 10,
                                        child: ClipRRect(child: Text((index + 1).toString())),
                                      ),

                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        height: double.parse(requirementsList[index].size),
                                        width: double.parse(requirementsList[index].size),
                                        child: Image.network("${requirementsList[index].image}"),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: (50 - double.parse(requirementsList[index].size))),
                                    ),
                                    Flexible(
                                      child: HtmlView(data:requirementsList[index].description,
                                      scrollable: false,)

                                    ),
                                  ]),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          })),
                    Container(
                       margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                       padding: EdgeInsets.all(5),
                       child:  SingleChildScrollView(
                         child: Text(
                           "Los trámites son gratuitos y sin intermediarios.\nRealízalos en la Unidad Local de Empadronamiento\n(ULE) de la municipalidad del distrito donde vives.",
                           style: TextStyle(color: ColorsApp.grayDark, fontSize: 15, fontWeight: FontWeight.w500),
                           textAlign: TextAlign.center,
                           strutStyle: StrutStyle(height: 1.2),
                           overflow: TextOverflow.ellipsis,
                           softWrap: true,
                           maxLines: 3,
                         ),
                         scrollDirection: Axis.horizontal,
                       ),

                     ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  getRequirements(List<RequirementsResponse> requirements) {
    setState(() {
      requirementsList = requirements;
    });
  }

  @override
  hideLoading() {}

  @override
  showLoading() {}

  @override
  onError(String message) {}
}
