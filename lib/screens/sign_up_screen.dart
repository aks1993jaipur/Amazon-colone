import 'dart:developer';

import 'package:amazon_app_1452022/resources/authentication_methods.dart';
import 'package:amazon_app_1452022/screens/sign_in_screens.dart';
import 'package:amazon_app_1452022/utils/color_themes.dart';
import 'package:amazon_app_1452022/utils/constants.dart';
import 'package:amazon_app_1452022/utils/utils.dart';
import 'package:amazon_app_1452022/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';

import '../widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Authenticationmethods authenticationmethods = Authenticationmethods();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
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
                        SizedBox(
                          height: screenSize.height * 0.7,
                          child: FittedBox(
                            child: Container(
                              height: screenSize.height * 0.85,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'sign-Up',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 33),
                                  ),
                                  TextFieldWidget(
                                    title: 'Name',
                                    controller: nameController,
                                    obsureText: false,
                                    hintText: 'Enter your name',
                                  ),
                                  TextFieldWidget(
                                    title: 'Address',
                                    controller: addressController,
                                    obsureText: false,
                                    hintText: 'Enter your address',
                                  ),
                                  TextFieldWidget(
                                    title: 'email',
                                    controller: emailController,
                                    obsureText: false,
                                    hintText: 'Enter your email',
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: CustomMainButton(
                                        child: const Text(
                                          'sign Up',
                                          style: TextStyle(
                                              letterSpacing: 0.6,
                                              color: Colors.black),
                                        ),
                                        color: yellowColor,
                                        isLoading: false,
                                        onPressed: () async {
                                          String output =
                                              await authenticationmethods
                                                  .signUpUser(
                                                      name: nameController.text,
                                                      address: addressController
                                                          .text,
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text);
                                          // Navigator.pop(context);
                                          if (output == "success") {
                                            log("doing next step");
                                          } else {
                                            utils().showSnackBar(
                                                context: context,
                                                content: output);
                                            log(output);
                                          }
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomMainButton(
                            child: const Text(
                              'Back',
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
                                return const SignInScreen();
                              }));
                            }),

                        // Navigator.pop(context);
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
