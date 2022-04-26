class Category {
  int? id;
  String? link;
  int? status;
  dynamic createdAt;
  String? updatedAt;

  Category({
    this.id,
    this.link,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    link = json['link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['link'] = link;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
