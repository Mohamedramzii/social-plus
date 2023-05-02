class UserModel {
  String? uID;
  String? firstname;
  String? lastname;
  String? email;
  String? image;
  String? cover;
  String? bio;
  String? phone;
  bool? isEmailVerified;
  UserModel({
    required this.uID,
    required this.firstname,
    required this.lastname,
    required this.email,
    this.image,
    this.cover,
    this.bio,
    required this.phone,
    required this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uID = json['uID'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    phone = json['phone'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uID': uID,
      'email': email,
      'image': image,
      'cover': cover,
      'bio': bio,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'isEmailVerified': isEmailVerified,
    };
  }
}
