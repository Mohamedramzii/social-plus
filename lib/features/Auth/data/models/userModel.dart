class UserModel {
  String? uID;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  bool? isEmailVerified;
  UserModel({
    required this.uID,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uID = json['uID'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uID': uID,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'isEmailVerified': isEmailVerified,
    };
  }
}
