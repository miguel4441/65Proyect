class RequirementsResponse {
  String size;
  String icon;
  String image;
  String description;
  String enlace;

  RequirementsResponse({this.size, this.icon, this.image, this.description, this.enlace});

  factory RequirementsResponse.fromJson(dynamic json) {
    return RequirementsResponse(
        size: json['size'],
        icon: json['icono'],
        image: json['image'],
        description: json['descripcion'],
        enlace: json['enlace'].toString().isEmpty == true || json['enlace'] == null ? '' : json['enlace']);
  }

  static List<RequirementsResponse> listFromJson(dynamic json) {
    var requirementsList = json as List;
    List<RequirementsResponse> items = requirementsList
        .map((item) => RequirementsResponse.fromJson(item))
        .toList();
    items.removeAt(0);
    return items ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      "size": size,
      "icon": icon,
      "image": image,
      "description": description,
      "enlace": enlace,
    };
  }
}
