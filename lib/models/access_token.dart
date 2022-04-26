class AccessToken {
  String? name;
  List<String>? abilities;
  int? tokenableId;
  String? tokenableType;
  String? updatedAt;
  String? createdAt;
  int? id;

  AccessToken({this.name, this.abilities, this.tokenableId, this.tokenableType, this.updatedAt, this.createdAt, this.id});

  AccessToken.fromJson(dynamic json) {
    name = json['name'];
    abilities = json['abilities'] != null ? json['abilities'].cast<String>() : [];
    tokenableId = json['tokenable_id'];
    tokenableType = json['tokenable_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['abilities'] = abilities;
    map['tokenable_id'] = tokenableId;
    map['tokenable_type'] = tokenableType;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }
}
