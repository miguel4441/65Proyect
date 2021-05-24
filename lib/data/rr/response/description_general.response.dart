class DescriptionGeneralResponse {

  String  description ;

  DescriptionGeneralResponse({ this.description });

  factory DescriptionGeneralResponse.fromJson(dynamic json) {
    return DescriptionGeneralResponse(

        description: json['DESCRIPCION'].toString().isEmpty == true || json['DESCRIPCION'] == null ? '' : json['DESCRIPCION'].toString(),

    );
  }

}
