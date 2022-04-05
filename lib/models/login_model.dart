class LoginModel {
 late bool status;
  String? message;
  UserData? userData;

  // LoginModel({this.status, this.message, this.userData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? birthdate;
  String? phone;

  UserData(
      {this.email,
        this.username,
        this.firstName,
        this.lastName,
        this.birthdate,
        this.phone});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthdate = json['birthdate'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['email'] = email;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['birthdate'] = birthdate;
    data['phone'] = phone;
    return data;
  }
}