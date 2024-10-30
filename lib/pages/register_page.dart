import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/widgets/default_button.dart';
import 'package:scholar_chat/widgets/default_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = "registerpage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailControlelr = TextEditingController();

  TextEditingController passwordControlelr = TextEditingController();

  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            // main column
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    // const Spacer(
                    //   flex: 1,
                    // ),
                    const Image(
                      image: AssetImage("assets/images/scholar.png"),
                      width: 150,
                      height: 150,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      "Scholar Chat",
                      style: TextStyle(
                        fontFamily: 'Pacifico-Regular',
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    // const Spacer(
                    //   flex: 1,
                    // ),
                    const SizedBox(
                      height: 80,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultText(
                        hintText: 'Email',
                        validator: (value) {
                          if (value.isEmpty) {
                            return "You must type your email";
                          }
                          return null;
                        },
                        obscureText: false,
                        controller: emailControlelr,
                        onChange: (value) {
                          email = value;
                        },
                        type: TextInputType.emailAddress),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultText(
                        hintText: 'password',
                        obscureText: true,
                        controller: passwordControlelr,
                        onChange: (value) {
                          password = value;
                        },
                        type: TextInputType.visiblePassword),

                    const SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                        onPress: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              isloading = true;
                              setState(() {});
                              await registerUser(email, password);
                              // showSnackBar(
                              //     context, "You register successfully");
                              Navigator.pushNamed(context, ChatPage.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackBar(context, 'Week password');
                              } else if (e.code == 'email-already-in-use') {
                                showSnackBar(context, 'email already exists');
                              } else {
                                showSnackBar(context, e.toString());
                              }
                            }
                            isloading = false;
                            setState(() {});
                          }
                        },
                        background: Colors.white,
                        color: Colors.black,
                        isUpperCase: true,
                        textSize: 20,
                        radius: 5,
                        text: 'REGISTER'),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return RegisterPage();
                        //     },
                        //   ),
                        // );

                        Navigator.pop(context);
                      },
                      child: Container(
                        child: const Text(
                          textAlign: TextAlign.center,
                          "Do you have an account Sing in now ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    // const Spacer(
                    //   flex: 2,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> registerUser(String? email, String? password) async {
    //var auth = FirebaseAuth.instance;
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
