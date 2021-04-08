class LoginEntity {
  String message;
  String userRegistrationEmail;
  String userRegistrationName;
  String userId;
  String token;
  int status;

  LoginEntity(
      {this.message,
        this.userRegistrationEmail,
        this.userRegistrationName,
        this.userId,
        this.token,
        this.status});

  LoginEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userRegistrationEmail = json['user_registration_email'];
    userRegistrationName = json['user_registration_name'];
    userId = json['userId'];
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['user_registration_email'] = this.userRegistrationEmail;
    data['user_registration_name'] = this.userRegistrationName;
    data['userId'] = this.userId;
    data['token'] = this.token;
    data['status'] = this.status;
    return data;
  }
}