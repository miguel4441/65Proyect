import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpResponse {
  static const headers = {'Content-Type': 'text/html'};

  //GET METHOD
  static get(
      String url, Function(dynamic) onSuccess, Function(String) onError) async {
    await http.get(url, headers: headers).then((data) {
      print("Get");
      print(data.statusCode);
      print(url);
      print(data.body);

      switch (data.statusCode) {
        case 200:
          if (data.body.trim() == "null") {
            onError("Dni no encontrado");
          } else {
            onSuccess(json.decode(utf8.decode(data.bodyBytes)));
          }
          break;
        default:
          onError("Error en el servicio");
          break;
      }
    }).catchError((error) {
      onError(error.toString());
    });
  }
}
