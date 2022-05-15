import 'package:amazon_app_1452022/screens/sign_in_screens.dart';
import 'package:amazon_app_1452022/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAvNm5kfw9WJ3pwI7-WoGVjVd8rM2atQCs",
            authDomain: "clone-af575.firebaseapp.com",
            projectId: "clone-af575",
            storageBucket: "clone-af575.appspot.com",
            messagingSenderId: "358677516306",
            appId: "1:358677516306:web:83561e6eb3bada0f6e48cb"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (user.hasData) {
              return Text('signed in');
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
