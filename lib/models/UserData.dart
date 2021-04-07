
class UserDataEntity {
  String errors;
  int code;
  String message;
  bool success;
  int firstLog;
  String token;
  UserDataEntity({this.errors, this.message});

  UserDataEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    code = json['code'];
    success = json['success'];
    message = json['message'];
    firstLog = json['firstLog'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['errors'] = this.errors;
    data['code'] = this.code;
    data['message'] = this.message;
    data['firstLog'] = this.firstLog;
    data['token'] = this.token;
    return data;
  }
}
