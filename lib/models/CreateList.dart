class CreateList {
  String message;
  Docs docs;
  int status;

  CreateList({this.message, this.docs, this.status});

  CreateList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    docs = json['docs'] != null ? new Docs.fromJson(json['docs']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.docs != null) {
      data['docs'] = this.docs.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Docs {
  String sId;
  bool deleteFlag;
  String currentTime;
  int iV;

  Docs(
      {this.sId,
        this.deleteFlag,
        this.currentTime,
        this.iV});

  Docs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];

    deleteFlag = json['delete_flag'];
    currentTime = json['current_time'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;

    data['delete_flag'] = this.deleteFlag;
    data['current_time'] = this.currentTime;
    data['__v'] = this.iV;
    return data;
  }
}