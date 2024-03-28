import 'package:firebase_project/model/authentic.dart';
import 'package:firebase_project/model/user_model.dart';
import 'package:firebase_project/model/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance =>  Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepo());

  void registerUser (String email, String password){
    AuthenticRep.instance.createUser(email, password) as String ?;
  }

  Future<void> createUser (UserModel user ) async{
    await userRepo.createUser(user);
  }
}