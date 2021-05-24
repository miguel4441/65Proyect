//  import 'dart:html';


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:yachaq/app/ui/nav_bar/bar.dart';
import 'package:yachaq/app/ui/questions/questions.presenter.dart';
import 'package:yachaq/app/ui/questions/questions.view.dart';
import 'package:yachaq/app/utils/colors.dart';
import 'package:yachaq/app/utils/resources.dart';
import 'package:yachaq/data/rr/response/questions.response.dart';
import 'package:yachaq/domain/repository/questions.repository.dart';

class QuestionPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => QuestionPage());

  @override
  _QuestionPage createState() => _QuestionPage();
}

class _QuestionPage extends State<QuestionPage> implements QuestionsView {
  List<QuestionResponse> questionsList = [];
  QuestionsPresenter _questionsPresenter;
  final ScrollController listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _questionsPresenter =
        QuestionsPresenter(questionsRepository: QuestionsRepository());
    _questionsPresenter.view = this;
    _questionsPresenter.getQuestions();

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
          appBar: questionsBar(context),
          body: Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 222,
                height: 58,
                child: Image.asset(Resources.pension65),
                margin: EdgeInsets.only(bottom: 30),
              ),
              Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: questionsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(mainAxisSize: MainAxisSize.max, children: [
                        new ExpansionTile(
                            leading: CircleAvatar(
                                  backgroundColor: ColorsApp.colorBoton,
                                  foregroundColor: Colors.white,
                                  radius: 12,
                                  child: ClipRRect(
                                      child: Text((index + 1).toString())),
                                ),
                            title: Container(
                              child: Html(
                                  data:
                                  """<h3><b>${questionsList[index].pregunta}</b></h3>""",
                                defaultTextStyle:  TextStyle(color: Colors.grey),),
                            ),
                            backgroundColor: Colors.white,
                            children: <Widget>[
                              Column(children: <Widget>[
                                ListTile(
                                  title: Container(
                                    child: Align(child: Html(
                                        data: questionsList[index].respuesta,
                                         defaultTextStyle:  TextStyle(color: Colors.grey, fontSize: 15.0,),
                                    ),
                                ),
                                    alignment: Alignment.center,),
                                ),
                              ])
                            ])
                      ]);
                    },
                  )),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  hideLoading() {}

  @override
  showLoading() {}

  @override
  onError(String message) {}

  @override
  getQuestions(List<QuestionResponse> questions) {
    setState(() {
      questionsList = questions;
    });
  }
}
