import 'package:flutter/material.dart';
import 'package:goose_task/screens/authToggle.dart';
import 'package:goose_task/screens/profile.dart';
import 'package:goose_task/screens/register.dart';
import 'package:goose_task/screens/signin.dart';
import 'package:goose_task/screens/signin_screen_2.dart';
import 'package:goose_task/services/auth.dart';
import 'firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return StreamProvider<User?>.value(
        value: Auth().user,
        initialData: FirebaseAuth.instance.currentUser,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Payment App',
          initialRoute: '/signin',
          routes: {
            '/': ((context) => const AuthToggle()),
            '/signin': ((context) => const SignIn()),
            '/register': ((context) => const Register()),
            '/signin2': ((context) => const SignIn2()),
            '/profile': ((context) => const Profile()),
          },
        ),
      );
    });
  }
}
