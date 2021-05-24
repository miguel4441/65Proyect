class ConsultationPensionResponse {
  String DNI;
  String NOMBRES;
  String APELLIDOS_NOMBRES;
  String SEXO;
  String MONTO;
  String PERIODO;
  String TERCERO;
  String MODALIDAD_PAGO;
  String LUGAR_AGENCIA;
  String FECHA_PAGO;
  String FECHAPAGOLABEL;
  String LATITUD;
  String LONGITUD;
  String CONDICION;
  String MENSAJE;

  ConsultationPensionResponse(
      {this.DNI,
        this.NOMBRES,
        this.APELLIDOS_NOMBRES,
        this.SEXO,
        this.MONTO,
        this.PERIODO,
        this.TERCERO,
        this.MODALIDAD_PAGO,
        this.LUGAR_AGENCIA,
        this.FECHA_PAGO,
        this.FECHAPAGOLABEL,
        this.LATITUD,
        this.LONGITUD,
        this.CONDICION,
        this.MENSAJE});

  ConsultationPensionResponse.fromJson(dynamic json) {
    DNI = json['DNI'].toString().isEmpty == true ? '' : json['DNI'].toString();
    NOMBRES = json['NOMBRES'].toString().isEmpty == true ? '' : json['NOMBRES'].toString();
    APELLIDOS_NOMBRES = json['APELLIDOS_NOMBRES'].toString().isEmpty == true ? '' : json['APELLIDOS_NOMBRES'].toString();
    SEXO = json['SEXO'].toString().isEmpty == true ? '' : json['SEXO'].toString();;
    MONTO = json['MONTO'].toString().isEmpty == true ? '' : json['MONTO'].toString();;
    PERIODO = json['PERIODO'].toString().isEmpty == true ? '' : json['PERIODO'].toString();;
    TERCERO = json['TERCERO'].toString().isEmpty == true ? '' : json['TERCERO'].toString();;
    MODALIDAD_PAGO = json['MODALIDAD_PAGO'].toString().isEmpty == true ? '' : json['MODALIDAD_PAGO'].toString();;
    LUGAR_AGENCIA = json['LUGAR_AGENCIA'].toString().isEmpty == true ? '' : json['LUGAR_AGENCIA'].toString();;
    FECHA_PAGO = json['FECHA_PAGO'].toString().isEmpty == true ? '' : json['FECHA_PAGO'].toString();;
    FECHAPAGOLABEL = json['FECHAPAGOLABEL'].toString().isEmpty == true ? '' : json['FECHAPAGOLABEL'].toString();;
    LATITUD = json['LATITUD'].toString().isEmpty == true ? '' : json['LATITUD'].toString();;
    LONGITUD = json['LONGITUD'].toString().isEmpty == true ? '' : json['LONGITUD'].toString();;
    CONDICION = json['CONDICION'].toString().isEmpty == true ? '' : json['CONDICION'].toString();;
    MENSAJE = json['MENSAJE'].toString().isEmpty == true ? '' : json['MENSAJE'].toString();;
  }

  static List<ConsultationPensionResponse> listFromJson(dynamic json) {

    var list = json as List;
    List<ConsultationPensionResponse> items = list.map((item) => ConsultationPensionResponse.fromJson(item)).toList();

    return items ?? [];
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DNI'] = this.DNI;
    data['APELLIDOS_NOMBRES'] = this.APELLIDOS_NOMBRES;
    data['MONTO'] = this.MONTO;
    data['PERIODO'] = this.PERIODO;
    data['MODALIDAD_PAGO'] = this.MODALIDAD_PAGO;
    data['LUGAR_AGENCIA'] = this.LUGAR_AGENCIA;
    data['LATITUD'] = this.LATITUD;
    data['LONGITUD'] = this.LONGITUD;
    data['CONDICION'] = this.CONDICION;
    return data;
  }*/
}