import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAu0rvedTEc7Oa-IyQwTS1Dn5IT7ieGUoU',  // current_key
          appId: '1:600210292427:android:b00bf1c318b725433a654e',  // mobilesdk_app_id
          messagingSenderId: '600210292427',  // project_number
          projectId: 'fir-project-bd21a'  // project_id
      )
  ) : await Firebase.initializeApp();
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}
