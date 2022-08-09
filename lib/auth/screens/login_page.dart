import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui/commons/form_field_widget.dart';
import 'package:login_signup_ui/commons/mixins.dart';
import 'package:login_signup_ui/commons/navigation_widget.dart';
import 'package:login_signup_ui/core/app_constant.dart';

class LoginPage extends StatefulWidget with ValidationMixin {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool validEmail = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 40,
                        bottom: 10,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: AppConstant.loginImage,
                      ),
                    ),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'You can find your dating partner and date,be friend, get connected for life',
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      child: FormFieldWidget(
                        controller: emailController,
                        inputAction: TextInputAction.next,
                        hintText: 'Email',
                        validator: (email) {
                          if (isEmailValid(email!)) {
                            setState(() {
                              validEmail = true;
                            });
                            return null;
                          } else {
                            setState(() {
                              validEmail = false;
                            });
                            return 'Enter Valid Email';
                          }
                        },
                        suffixIcon: validEmail
                            ? const Icon(Icons.check)
                            : const Text(''),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      child: FormFieldWidget(
                        obscureText: passwordVisible,
                        controller: passwordController,
                        hintText: 'Password',
                        validator: (password) {
                          if (isPasswordValid(password!)) {
                            return null;
                          } else {
                            return 'Enter Valid Password';
                          }
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: !passwordVisible
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 20,
                                  color: Colors.grey[500]!,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 20,
                                  color: Colors.grey[500]!,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Text(
                          'Forgot password ?',
                          style: TextStyle(
                            color: Colors.red.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        loginKey.currentState!.validate();
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.red.withOpacity(0.8),
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: SizedBox(
                            height: 5,
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 5,
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        normalNavigation(context, const SignUpPage());
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppConstant.primaryColor),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign UP',
                            style: TextStyle(
                              color: AppConstant.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
