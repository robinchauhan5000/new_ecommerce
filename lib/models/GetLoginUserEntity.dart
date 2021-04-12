class GetLoginUserEntity {
  String message;
  List<Docs> docs;
  int status;

  GetLoginUserEntity({this.message, this.docs, this.status});

  GetLoginUserEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['docs'] != null) {
      docs = new List<Docs>();
      json['docs'].forEach((v) {
        docs.add(new Docs.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.docs != null) {
      data['docs'] = this.docs.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Docs {
  String sId;
  String userName;
  String userEmail;
  String userMobile;
  String userZipCode;
  String userCountry;
  String currentTime;
  int iV;
  String userProfileImage;
  String userAddress;
  String userState;

  Docs(
      {this.sId,
        this.userName,
        this.userEmail,
        this.userMobile,
        this.userZipCode,
        this.userCountry,
        this.currentTime,
        this.iV,
        this.userProfileImage,
        this.userAddress,
        this.userState});

  Docs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userMobile = json['user_mobile'];
    userZipCode = json['user_zip_code'];
    userCountry = json['user_country'];
    currentTime = json['current_time'];
    iV = json['__v'];
    userProfileImage = json['user_profile_image'];
    userAddress = json['user_address'];
    userState = json['user_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_mobile'] = this.userMobile;
    data['user_zip_code'] = this.userZipCode;
    data['user_country'] = this.userCountry;
    data['current_time'] = this.currentTime;
    data['__v'] = this.iV;
    data['user_profile_image'] = this.userProfileImage;
    data['user_address'] = this.userAddress;
    data['user_state'] = this.userState;
    return data;
  }
}