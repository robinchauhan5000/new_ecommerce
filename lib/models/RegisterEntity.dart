class RegisterEntity {
  String message;
  Verification verification;
  int status;

  RegisterEntity({this.message, this.verification, this.status});

  RegisterEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    verification = json['verification'] != null
        ? new Verification.fromJson(json['verification'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.verification != null) {
      data['verification'] = this.verification.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Verification {
  String sid;
  String serviceSid;
  String accountSid;
  String to;
  String channel;
  String status;
  bool valid;
  Lookup lookup;
  Null amount;
  Null payee;
  List<SendCodeAttempts> sendCodeAttempts;
  String dateCreated;
  String dateUpdated;
  String url;

  Verification(
      {this.sid,
        this.serviceSid,
        this.accountSid,
        this.to,
        this.channel,
        this.status,
        this.valid,
        this.lookup,
        this.amount,
        this.payee,
        this.sendCodeAttempts,
        this.dateCreated,
        this.dateUpdated,
        this.url});

  Verification.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    serviceSid = json['serviceSid'];
    accountSid = json['accountSid'];
    to = json['to'];
    channel = json['channel'];
    status = json['status'];
    valid = json['valid'];
    lookup =
    json['lookup'] != null ? new Lookup.fromJson(json['lookup']) : null;
    amount = json['amount'];
    payee = json['payee'];
    if (json['sendCodeAttempts'] != null) {
      sendCodeAttempts = new List<SendCodeAttempts>();
      json['sendCodeAttempts'].forEach((v) {
        sendCodeAttempts.add(new SendCodeAttempts.fromJson(v));
      });
    }
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sid'] = this.sid;
    data['serviceSid'] = this.serviceSid;
    data['accountSid'] = this.accountSid;
    data['to'] = this.to;
    data['channel'] = this.channel;
    data['status'] = this.status;
    data['valid'] = this.valid;
    if (this.lookup != null) {
      data['lookup'] = this.lookup.toJson();
    }
    data['amount'] = this.amount;
    data['payee'] = this.payee;
    if (this.sendCodeAttempts != null) {
      data['sendCodeAttempts'] =
          this.sendCodeAttempts.map((v) => v.toJson()).toList();
    }
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['url'] = this.url;
    return data;
  }
}

class Lookup {
  Carrier carrier;

  Lookup({this.carrier});

  Lookup.fromJson(Map<String, dynamic> json) {
    carrier =
    json['carrier'] != null ? new Carrier.fromJson(json['carrier']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carrier != null) {
      data['carrier'] = this.carrier.toJson();
    }
    return data;
  }
}

class Carrier {
  String mobileCountryCode;
  String type;
  Null errorCode;
  String mobileNetworkCode;
  String name;

  Carrier(
      {this.mobileCountryCode,
        this.type,
        this.errorCode,
        this.mobileNetworkCode,
        this.name});

  Carrier.fromJson(Map<String, dynamic> json) {
    mobileCountryCode = json['mobile_country_code'];
    type = json['type'];
    errorCode = json['error_code'];
    mobileNetworkCode = json['mobile_network_code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_country_code'] = this.mobileCountryCode;
    data['type'] = this.type;
    data['error_code'] = this.errorCode;
    data['mobile_network_code'] = this.mobileNetworkCode;
    data['name'] = this.name;
    return data;
  }
}

class SendCodeAttempts {
  String attemptSid;
  String channel;
  String time;

  SendCodeAttempts({this.attemptSid, this.channel, this.time});

  SendCodeAttempts.fromJson(Map<String, dynamic> json) {
    attemptSid = json['attempt_sid'];
    channel = json['channel'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attempt_sid'] = this.attemptSid;
    data['channel'] = this.channel;
    data['time'] = this.time;
    return data;
  }
}