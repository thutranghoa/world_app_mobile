import 'package:firebase_project/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../components/forward_icon.dart';
import '../components/mydrawer.dart';
import '../components/setting_items.dart';
import '../models/interfaces.dart';
import '../widgets/home_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  void initState() {
    super.initState();
  }

  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
          return Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              backgroundColor: ui.appBarColor,
              title: Text("Settings",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
              leading: Builder(
                builder: (BuildContext builderContext) {
                  return IconButton(
                    onPressed: () => Scaffold.of(builderContext).openDrawer(),
                    icon: const Icon(Ionicons.apps_outline),
                    color: Colors.white,
                  );
                },
              ),
              leadingWidth: 80,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F9FD),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF475269).withOpacity(0.3),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),

                            child: Icon(
                              Icons.person,
                              size: 45,
                              color: Color(0xFF475269),
                            ),
                          ),

                          const SizedBox(width: 20),
                          // const Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "Admin",
                          //       style: TextStyle(
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //     SizedBox(height: 10),
                          //     Text(
                          //       "shoemaker@gmail.com",
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //         color: Color(0xFF475269),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('Users').snapshots(),
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                if (snapshot.hasData){
                                  return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i){
                                        var data = snapshot.data!.docs[i];
                                        return Text(data['Email']);
                                      }
                                  );
                                }else{
                                  return CircularProgressIndicator();
                                }
                              }
                          ),
                          const Spacer(),
                          ForwardIcon(onTap: () {Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfilePage()));},),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Provider.of<UserInterface>(context, listen: false).resetSettings();
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple.shade100,
                            ),
                            child: Icon(
                              Ionicons.logo_firefox,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            "Dark Mode",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            Provider
                                .of<UserInterface>(context)
                                .themeMode == ThemeMode.dark ? "Dark" : "Light",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF475269),
                            ),
                          ),
                          const SizedBox(width: 10),

                          Switch(
                            value: Provider
                                .of<UserInterface>(context)
                                .themeMode == ThemeMode.dark,
                            onChanged: (value) {
                              ThemeMode newThemeMode = value
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                              Provider
                                  .of<UserInterface>(context, listen: false)
                                  .themeMode = newThemeMode;
                            },
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.shade100,
                            ),
                            child: Icon(
                              Ionicons.earth,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: "Notifications",
                      icon: Ionicons.notifications,
                      bgColor: Colors.blue.shade100,
                      iconColor: Colors.blue,
                      onTap: () {},
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green.shade100,
                            ),
                            child: Icon(
                              Ionicons.nuclear,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            "Colors",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),

                          const SizedBox(width: 20),
                          Container(
                              child: DropdownButton<String>(
                                value: ui.strAppBarColor,
                                items: UserInterface.listColorAppBar.map<
                                    DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,style: TextStyle(color: Color(0xFF475269), fontWeight: FontWeight.w400),),
                                      );
                                    }
                                ).toList(),
                                onChanged: (String? value) {
                                  ui.appBarColor = value!;
                                },
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    InkWell(
                      onTap: () => Navigator.pushNamed(context, "/"),
                      child: SettingItem(
                        title: "Logout",
                        icon: Ionicons.log_out,
                        bgColor: Colors.red.shade100,
                        iconColor: Colors.red,
                        onTap: () => Navigator.pushNamed(context, "/"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: HomeBottomBar(),
          );
        }
    );
  }

}




