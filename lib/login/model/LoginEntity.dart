/// phone : "123456"
/// password : "123456"

class LoginEntity {
  LoginEntity({required this.phone, required this.password});

  LoginEntity.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] as String;
    password = json['password'] as String;
  }

  late String phone;
  late String password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}
