class RegisterModel {
  User? user;

  RegisterModel({this.user});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    user = json['User'] != null ?  User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? clientName;
  String? mail;
  int? country;
  bool? clientStatus;
  String? clientPhone;
  int? clientGender;
  int? clientId;

  User(
      {this.clientName,
      this.mail,
      this.country,
      this.clientStatus,
      this.clientPhone,
      this.clientGender,
      this.clientId});

  User.fromJson(Map<String, dynamic> json) {
    clientName = json['client_name'];
    mail = json['mail'];
    country = json['country'];
    clientStatus = json['client_status'];
    clientPhone = json['client_phone'];
    clientGender = json['client_gender'];
    clientId = json['client_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['client_name'] =clientName;
    data['mail'] =mail;
    data['country'] =country;
    data['client_status'] =clientStatus;
    data['client_phone'] =clientPhone;
    data['client_gender'] =clientGender;
    data['client_id'] =clientId;
    return data;
  }
}
