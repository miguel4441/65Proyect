class QuestionResponse {

  String pregunta;
  String respuesta;


  QuestionResponse({this.pregunta, this.respuesta});

  factory QuestionResponse.fromJson(dynamic json) {

    return QuestionResponse(
        pregunta: json['pregunta'].toString().isEmpty == true || json['pregunta'] == null ? '' : json['pregunta'],
        respuesta: json['respuesta'].toString().isEmpty == true || json['respuesta'] == null ? '' : json['respuesta'],


    );
  }

  static List<QuestionResponse> listFromJson(dynamic json) {

    var questionsList = json as List;
    List<QuestionResponse> items = questionsList.map((item) => QuestionResponse.fromJson(item)).toList();

    return items ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      "pregunta": pregunta,
      "respuesta": respuesta,
    };
  }

}