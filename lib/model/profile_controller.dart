import 'dart:ffi';

import 'package:firebase_project/model/authentic.dart';
import 'package:firebase_project/model/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthenticRep());
  final _userRepo = Get.put(UserRepo());

  getUserData (){
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    }else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}