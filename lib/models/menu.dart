class Menu {
  int? id;
  int? status;
  String? link;
  String? version;
  String? createdAt;
  String? updatedAt;

  Menu({this.id, this.status, this.link, this.version, this.createdAt, this.updatedAt});

  Menu.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    link = json['link'];
    version = json['version'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['link'] = link;
    map['version'] = version;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
