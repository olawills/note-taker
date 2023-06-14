import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email, password, lastName, firstName;
  const UserModel(
      {required this.email,
      required this.password,
      required this.lastName,
      required this.firstName});

  factory UserModel.fromSnapshot(DocumentSnapshot map) => UserModel(
        email: map['email'],
        password: map['password'],
        lastName: map['lastName'],
        firstName: map['firstName'],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        lastName = json['lastName'],
        firstName = json['firstName'],
        password = json['password'];
}
