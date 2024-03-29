import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login/signin_screen.dart';
import 'models/interfaces.dart';
import 'pages/home_page.dart';
import 'pages/country.dart';
import 'pages/settings_page.dart';
import 'dart:io';
import "package:provider/provider.dart";
import "package:firebase_project/pages/favorites_page.dart";
import "package:firebase_project/widgets/welcome_screen.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAu0rvedTEc7Oa-IyQwTS1Dn5IT7ieGUoU',  // current_key
          appId: '1:600210292427:android:b00bf1c318b725433a654e',  // mobilesdk_app_id
          messagingSenderId: '600210292427',  // project_number
          projectId: 'fir-project-bd21a'  // project_id

          // apiKey: 'AIzaSyC7_oH3hpSNwsF0d4JkV3jUD1rhvvX8jYE',  // current_key
          // appId: '1:825549254388:android:51c423d32250080b18b8a1',  // mobilesdk_app_id
          // messagingSenderId: '825549254388',  // project_number
          // projectId: 'country-app-cb075'  // project_id
      )
  ) : await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserInterface()),
    ],
    child: MyApp(),
  ),);
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<UserInterface>(context).themeMode,
      routes: {
        "homePage": (context) => HomePage(),
        "settingsPage": (context) => SettingsPage(),
        'loginPage': (context) => SignInScreen(),
        // "favoritesPage"  : (context) => FavoritePage(),
        // "productPage": (context) => ProductView(),

        // "orderDetail": (context) => ChiTietHoaDon(),
      },
      home: WelcomeScreen(),
    );
  }
}
