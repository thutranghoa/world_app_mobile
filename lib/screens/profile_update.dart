import "package:firebase_project/model/profile_controller.dart";
import "package:firebase_project/model/user_model.dart";
import "package:firebase_project/screens/profile_creen.dart";
import "package:flutter/material.dart" ;
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put (ProfileController());
    return Scaffold(
      appBar: AppBar (
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("EDIT PROFILE"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done){
                if (snapshot.hasData){
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                "",
                              ),
                            ),),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.yellow),
                                child: const Icon(Icons.camera_alt_outlined, size: 20,),
                              )


                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            initialValue: userData.userName,
                            decoration: const InputDecoration(label: Text("Username"), prefixIcon: Icon(Icons.person_outline_outlined)),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            decoration: const InputDecoration(label: Text("E-Mail"), prefixIcon: Icon(Icons.email_outlined)),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            decoration: const InputDecoration(label: Text("Phone number"), prefixIcon: Icon(Icons.phone_android_outlined)),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            decoration: const InputDecoration(label: Text("Password"), prefixIcon: Icon(Icons.fingerprint_outlined)),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: ()=> Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => Profile())),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text("Edit", style: TextStyle(color: Colors.black, fontSize: 18)),
                            ),
                          )
                        ],
                      ))
                    ],
                  );
                }else if (snapshot.hasError){
                  return Center(child:  Text(snapshot.error.toString()));
                }else {
                  return const Center(child: Text("Something went wrong"));
                }
              }else{
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
