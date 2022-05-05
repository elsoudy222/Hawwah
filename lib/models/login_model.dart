class LoginModel {
  String? firstName;
  String? email;
  String? phone;
  Tokens? tokens;
  LoginModel({this.firstName, this.email, this.phone, this.tokens});
  LoginModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    email = json['email'];
    phone = json['phone'];
    tokens =
    json['tokens'] != null ?  Tokens.fromJson(json['tokens']) : null;
  }

}

class Tokens {
  String? refresh;
  String? access;
  Tokens({this.refresh, this.access});

  Tokens.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }


}