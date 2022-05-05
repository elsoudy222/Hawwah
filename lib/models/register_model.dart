class RegisterModel {
  Data? data;

  RegisterModel({this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  bool? status;
  String? message;
  UserData? userData;

  Data({this.status, this.message, this.userData});
  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user_data'] != null
        ?  UserData.fromJson(json['user_data'])
        : null;
  }
}

class UserData {
  String? email;
  String? firstName;
  String? lastName;
  String? birthdate;
  String? phone;

  UserData(
      {this.email, this.firstName, this.lastName, this.birthdate, this.phone});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthdate = json['birthdate'];
    phone = json['phone'];
  }


}