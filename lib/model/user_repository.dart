import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser (UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(
            () {
              Get.snackbar("Success", " Your account has been created !",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green,
              );
            }).catchError((error, stackTrace) {
              Get.snackbar("Error", "Something went wrong. Try again ",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent.withOpacity(0.1),
                colorText: Colors.red);
              print ("Error - $error");
    });
  }

  Future<UserModel> getUserDetails (String email) async{
    final snapshot = await _db.collection("User").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async{
    final snapshot = await _db.collection("User").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}