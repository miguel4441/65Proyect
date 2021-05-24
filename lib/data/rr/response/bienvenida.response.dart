class BienvenidaResponse {
  String titulo;
  String alerta;
  String image;
  String icon;
  String tipo;

  BienvenidaResponse({this.titulo, this.alerta, this.image, this.icon, this.tipo});

  factory BienvenidaResponse.fromJson(dynamic json) {
    return BienvenidaResponse(
        titulo: json['titulo'], alerta: json['alerta'], image: json['image'], icon: json['icon'], tipo: json['tipo']);
  }

  static List<BienvenidaResponse> listFromJson(dynamic json) {
    var bienvenidaList = json as List;
    List<BienvenidaResponse> items = bienvenidaList.map((e) => BienvenidaResponse.fromJson(e)).toList();
    return items ?? [];
  }
/*
  Map<String, dynamic> toJson() {
    return {
      "titulo": titulo,
      "alerta": alerta,
      "image": image,
      "icon": icon,
      "tipo": tipo,
    };
  }
 */
}
