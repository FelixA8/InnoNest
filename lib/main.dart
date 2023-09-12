import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mechar/screens/home_screen.dart';
import 'package:mechar/screens/login_screen.dart';
import 'package:mechar/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  //firebase set up
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //run the app class
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //not showing the banner
      debugShowCheckedModeBanner: false,
      title: 'Mech AR',
      theme: ThemeData().copyWith(
        useMaterial3: true,
      ),
      // home is a streambuilder widget. Where it will listen whether the user is logged in or not.
      // the stream will be the firebaseauthstatechanges where when there is a log in activity, it will change to the
      // home screen. Else it will get to the auth screen. When there is no connection/ slow connection, it will show the splash screen widget
      // note: home screen will be shown when the snapshot has data.
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const AuthScreen();
        },
      ),
    );
  }
}
