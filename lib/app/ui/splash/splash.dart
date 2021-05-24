import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yachaq/app/ui/dialog/dialog_init.dart';
import 'package:yachaq/app/ui/home/home.dart';
import 'package:yachaq/app/utils/resources.dart';
import 'package:yachaq/data/rr/response/bienvenida.response.dart';
import 'package:yachaq/domain/repository/bienvenida.repository.dart';

class SplashPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(builder: (context) => SplashPage());

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<BienvenidaResponse> varBienvenidaList = [];
  @override
  void initState() {
    super.initState();
    toHome();
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
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Image.asset(Resources.bicentenario),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 222,
                    height: 65,
                    margin: EdgeInsets.all(20),
                    child: Image.asset(Resources.pension65),
                  )),
              Align(
                //alignment: Alignment.topCenter,
                  child: Container(
                    width: 200,
                    //height: 65,
                    margin: EdgeInsets.only(bottom: 170),
                    child: Image.asset(Resources.midis),
                  )),
            ],
          )),
    );
  }

  void toHome() {
    Timer.periodic(Duration(seconds: 3), (time) async {
      _showDialog();
      time.cancel();
    });
  }

  _showDialog() async {
    bool siHayBienvenida = false;
    BienvenidaRepository bienvenidaRepository = BienvenidaRepository();
    await bienvenidaRepository.bienvenida((bienvenidaList) {
      for (int i = 0; i < bienvenidaList.length; i++) {
        if (bienvenidaList[i].tipo == 'bienvenida' && bienvenidaList[i].alerta != '') {
          siHayBienvenida = true;
          varBienvenidaList.add(bienvenidaList[i]);
        }
      }
    }, (message) => null).whenComplete(() {
      if (siHayBienvenida) {
        SchedulerBinding.instance.addPostFrameCallback((_) => showDialog(
            context: context,
            builder: (BuildContext context) {
              return DialogInit(bienvenidaList: varBienvenidaList);
            },
        ),);
      }
    });

    Navigator.pushAndRemoveUntil(context, HomePage.route(), (route) => false);
  }
}