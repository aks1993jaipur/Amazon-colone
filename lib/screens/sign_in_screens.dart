import 'package:amazon_app_1452022/resources/authentication_methods.dart';
import 'package:amazon_app_1452022/screens/sign_up_screen.dart';
import 'package:amazon_app_1452022/utils/color_themes.dart';
import 'package:amazon_app_1452022/utils/constants.dart';
import 'package:amazon_app_1452022/utils/utils.dart';
import 'package:amazon_app_1452022/widgets/custom_main_button.dart';
import 'package:amazon_app_1452022/widgets/text_field_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Authenticationmethods authenticationmethods = Authenticationmethods();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = utils().getScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: screenSize.height * 0.6,
                          width: screenSize.width * 0.8,
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'sign-In',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 33),
                              ),
                              TextFieldWidget(
                                title: 'Email',
                                controller: emailcontroller,
                                obsureText: false,
                                hintText: 'Enter your email',
                              ),
                              TextFieldWidget(
                                title: 'Password',
                                controller: passwordController,
                                obsureText: false,
                                hintText: 'Enter your password',
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CustomMainButton(
                                    child: const Text(
                                      'sign In',
                                      style: TextStyle(
                                          letterSpacing: 0.6,
                                          color: Colors.black),
                                    ),
                                    color: yellowColor,
                                    isLoading: false,
                                    onPressed: () async {
                                      String output =
                                          await authenticationmethods.sigInUser(
                                              email: emailcontroller.text,
                                              password:
                                                  passwordController.text);
                                      if (output == 'success') {
                                      } else {
                                        utils().showSnackBar(
                                            context: context, content: output);
                                      }
                                    }),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'New to Amazon?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomMainButton(
                            child: const Text(
                              'Create an Amazon Account',
                              style: TextStyle(
                                letterSpacing: 0.6,
                                color: Colors.black,
                              ),
                            ),
                            color: Colors.grey[400]!,
                            isLoading: false,
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignUpScreen();
                              }));
                            })
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
