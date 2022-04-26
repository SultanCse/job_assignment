class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? phone;
  dynamic emailVerifiedAt;
  String? promoCode;
  int? verify;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.phone,
    this.emailVerifiedAt,
    this.promoCode,
    this.verify,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    promoCode = json['promo_code'];
    verify = json['verify'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['username'] = username;
    map['phone'] = phone;
    map['email_verified_at'] = emailVerifiedAt;
    map['promo_code'] = promoCode;
    map['verify'] = verify;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
