import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui/auth/screens/login_page.dart';
import 'package:login_signup_ui/commons/form_field_widget.dart';
import 'package:login_signup_ui/commons/mixins.dart';
import 'package:login_signup_ui/commons/navigation_widget.dart';
import 'package:login_signup_ui/core/app_constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with ValidationMixin {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  GlobalKey<FormState> signUPKey = GlobalKey<FormState>();

  bool validEmail = false;
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ClipPath(
              //   clipper: WaveClipper(),
              //   child: Container(
              //     color: Colors.green,
              //     height: 200,
              //   ),
              // ),
              SizedBox(
                height: 200,
                child: CachedNetworkImage(imageUrl: AppConstant.signupImage),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: signUPKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        child: FormFieldWidget(
                          controller: firstNameController,
                          inputAction: TextInputAction.next,
                          isCapital: true,
                          hintText: 'First Name',
                          validator: (name) {
                            if (isNameValid(name!)) {
                              return null;
                            } else {
                              return 'First Name can\'t be empty';
                            }
                          },
                          suffixIcon: const Text(''),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: FormFieldWidget(
                          controller: lastNameController,
                          inputAction: TextInputAction.next,
                          isCapital: true,
                          hintText: 'Last Name',
                          validator: (name) {
                            if (isNameValid(name!)) {
                              return null;
                            } else {
                              return 'Name can\'t be empty';
                            }
                          },
                          suffixIcon: const Text(''),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: FormFieldWidget(
                          keyboardType: TextInputType.phone,
                          inputAction: TextInputAction.next,
                          maxLength: 10,
                          controller: contactController,
                          hintText: 'Contact',
                          validator: (phone) {
                            if (isPhoneValid(phone!)) {
                              return null;
                            } else {
                              return 'Enter Valid Number';
                            }
                          },
                          suffixIcon: const Text(''),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: FormFieldWidget(
                          controller: addressController,
                          inputAction: TextInputAction.next,
                          isCapital: true,
                          hintText: 'Address',
                          validator: (name) {
                            if (isNameValid(name!)) {
                              return null;
                            } else {
                              return 'Address can\'t be empty';
                            }
                          },
                          suffixIcon: const Text(''),
                        ),
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
                          inputAction: TextInputAction.go,
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
                      InkWell(
                        onTap: () async {
                          if (signUPKey.currentState!.validate()) {}
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.red.withOpacity(0.8),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign UP',
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
                          normalNavigation(context, const LoginPage());
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppConstant.primaryColor),
                          ),
                          child: const Center(
                            child: Text(
                              'Login',
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
              const SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Have an account ? ',
              //         style: TextStyle(
              //           color: Colors.red.withOpacity(0.8),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () =>
              //             normalNavigation(context, const LoginPage()),
              //         child: Text(
              //           'Log in',
              //           style: TextStyle(
              //             color: Colors.red.withOpacity(0.8),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
