import 'package:firebase_project/screens/home_screen.dart';
import 'package:firebase_project/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticRep extends GetxController {
  static AuthenticRep get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;
  var verificationID = ''.obs;

  @override
  void onReady(){
    firebaseUser = Rx<User?> (_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);

  }

  _setInitialScreen (User? user){
    user == null ? Get.offAll (() => const SignInScreen()) : Get.offAll(() => const HomeScreen());
  }

  Future<void> createUser (String email, String password) async{
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }on FirebaseAuthException catch (e){
    }catch (_) {}
  }

  Future<void> loginUser (String email, String password) async{
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    }on FirebaseAuthException catch (e){
    }catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();

}