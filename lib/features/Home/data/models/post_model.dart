class PostModel {
  String? uID;
  String? firstname;
  String? lastname;
  String? image;
  String? dateTime;
  String? bodytext;
  String? postImage;
  PostModel({
    required this.uID,
    required this.firstname,
    required this.lastname,
    this.image,
    this.dateTime,
    this.bodytext,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    uID = json['uID'];

    firstname = json['firstname'];
    lastname = json['lastname'];
    image = json['image'];
    dateTime = json['dateTime'];
    bodytext = json['bodytext'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uID': uID,
      'image': image,
      'firstname': firstname,
      'lastname': lastname,
      'dateTime': dateTime,
      'bodytext': bodytext,
      'postImage': postImage,
    };
  }
}
