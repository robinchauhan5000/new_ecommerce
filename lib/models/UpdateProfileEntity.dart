class UpdateProfileEntity {
  String message;
  List<Null> docs;
  int status;

  UpdateProfileEntity({this.message, this.docs, this.status});

  UpdateProfileEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
   /* if (json['docs'] != null) {
      docs = new List<Null>();
      json['docs'].forEach((v) {
        docs.add(new Null.fromJson(v));
      });
    }*/
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
  /*  if (this.docs != null) {
      data['docs'] = this.docs.map((v) => v.toJson()).toList();
    }*/
    data['status'] = this.status;
    return data;
  }
}