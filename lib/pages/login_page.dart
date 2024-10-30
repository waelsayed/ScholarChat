import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/widgets/default_button.dart';
import 'package:scholar_chat/widgets/default_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "loginpage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool isloading = false;

  TextEditingController emailControlelr = TextEditingController();

  TextEditingController passwordControlelr = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey();

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
                key: keyForm,
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
                        "LOGIN",
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
                        onChange: (data) {
                          email = data;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email can't be empty";
                          }
                          return null;
                        },
                        obscureText: false,
                        controller: emailControlelr,
                        type: TextInputType.emailAddress),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultText(
                        hintText: 'password',
                        onChange: (data) {
                          password = data;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password can't be empty";
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: passwordControlelr,
                        type: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                        onPress: () async {
                          if (keyForm.currentState!.validate()) {
                            try {
                              isloading = true;
                              setState(() {});
                              await loginUser(email!, password!);
                              // showSnackBar(context, 'You login Succeed');
                              Navigator.pushNamed(context, ChatPage.id , arguments: email);
                            } on FirebaseAuthException catch (e) {
                              print(e.code);
                              if (e.code == 'user-not-found') {
                                showSnackBar(
                                    context, 'No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                showSnackBar(context,
                                    'Wrong password provided for that user.');
                              } else if (e.code == 'invalid-email') {
                                showSnackBar(
                                    context, 'invalid email , try again.');
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
                        text: 'Sing in'),
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
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Container(
                        child: const Text(
                          textAlign: TextAlign.center,
                          "don't have an account Sing up now ",
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

  Future<void> loginUser(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
