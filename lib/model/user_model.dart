import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String userName;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.userName,
  });

  toJson(){
    return {
      "userName" : userName,
      "email" : email,
      "phone" : phoneNo,
      "password" : password,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
        email: data["Email"],
        password: data["Password"],
        phoneNo: data["Phone"],
        userName: data["Username"]);
  }
}