class UserModel {
  String? uid;
  String? username;
  String? emailAddress;
  String? firstname;
  String? lastname;
  String phonenumber;
  String address;

  UserModel({
    this.uid,
    required this.username,
    required this.emailAddress,
    required this.firstname,
    required this.lastname,
    this.phonenumber = '',
    this.address = '',
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      emailAddress: map['emailAddress'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      phonenumber: map['phoneNumber'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'emailAddress': emailAddress,
      'firstname': firstname,
      'lastname': lastname,
      'phonenumber': phonenumber,
      'address': address,
    };
  }
}
