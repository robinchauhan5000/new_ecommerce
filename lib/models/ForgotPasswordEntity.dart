class ForgotPasswordEntity {
  String errors;
  int status;
  String message;
  ForgotPasswordEntity({this.errors,this.message});

  ForgotPasswordEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

}
