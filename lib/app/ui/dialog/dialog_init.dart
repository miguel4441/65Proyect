import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';


import 'package:yachaq/app/utils/colors.dart';


import 'package:yachaq/data/rr/response/bienvenida.response.dart';

class DialogInit extends StatefulWidget {
  final List<BienvenidaResponse> bienvenidaList;

  const DialogInit({Key key, this.bienvenidaList}) : super(key: key);

  @override
  _DialogInit createState() => _DialogInit(bienvenidaList: bienvenidaList);
}

class _DialogInit extends State<DialogInit> {
  List<BienvenidaResponse> bienvenidaList;
  _DialogInit({this.bienvenidaList});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contextBox(context),
    );
  }

  contextBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: 30,
              top: 45,
              right: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            /*boxShadow: [
              BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]*/
          ),
          height: 300,
          child: ListView.builder(
            itemCount: bienvenidaList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                    visible: (index == 0) ? true : false,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        bienvenidaList[index].titulo,
                        style: TextStyle(fontSize: 22, color: ColorsApp.grayDark),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Visibility(
                        visible: (bienvenidaList[index].image != "") ? true : false,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.network("${bienvenidaList[index].image}"),
                                margin: EdgeInsets.only(bottom: 5, top: 5),
                                padding: EdgeInsets.only(right: 10))),
                      ),
                      Flexible(
                        child: HtmlView(
                          data: bienvenidaList[index].alerta,
                          scrollable: false,
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
