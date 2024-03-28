import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/model/signUp_controller.dart';
import 'package:firebase_project/model/user_model.dart';
import 'package:firebase_project/reusable_widgets/reusable_widget.dart';
import 'package:firebase_project/screens/home_screen.dart';
import 'package:firebase_project/screens/signin_screen.dart';
import 'package:firebase_project/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();

  
  // void _signup() {
  //   String name = _userNameTextController.text;
  //   String email = _emailTextController.text;
  //
  //   FirebaseFirestore.instance.collection("users")
  // }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState> ();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),

                  reusableTextField("Enter UserName", Icons.person_outline, false,
                      _userNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email ", Icons.email_outlined, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outlined, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Phone number", Icons.phone_android_outlined, true,
                      _phoneTextController),
                  const SizedBox(
                    height: 20,
                  ),


                  // firebaseUIButton(context, "Sign Up", () {
                  //   FirebaseFirestore.instance.collection("Users").add ({
                  //     "Username" : _userNameTextController.text,
                  //     "Email" : _emailTextController.text,
                  //     "Password" : _passwordTextController.text,
                  //     "Phone" : _phoneTextController.text
                  //
                  //   })
                  //       .then((value) {
                  //     print("Created New Account");
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => HomeScreen()));
                  //   }).onError((error, stackTrace) {
                  //     print("Error ${error.toString()}");
                  //   });
                  // })
                  firebaseUIButton(context, "Sign Up", () {
                    final user = UserModel(
                        email: _userNameTextController.text.trim(),
                        password: _passwordTextController.text.trim(),
                        phoneNo: _phoneTextController.text.trim(),
                        userName: _userNameTextController.text.trim());

                    SignUpController.instance.createUser(user)
                        .then((value) {
                      print("Created New Account");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  })


                ],
              ),
            ),
          ))),
    );
  }
}
