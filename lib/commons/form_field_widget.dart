// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:login_signup_ui/commons/mixins.dart';

class FormFieldWidget extends StatefulWidget {
  FormFieldWidget({
    Key? key,
    required this.controller,
    this.validator,
    required this.hintText,
    this.suffixIcon = const Text(''),
    this.obscureText = false,
    this.maxLength = 50,
    this.keyboardType = TextInputType.emailAddress,
    this.isCapital = false,
    this.inputAction = TextInputAction.done,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  Widget? suffixIcon;
  final String hintText;
  bool obscureText;
  int? maxLength;
  TextInputType keyboardType;
  TextInputAction inputAction;

  bool isCapital;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget>
    with ValidationMixin {
  bool passwordVisible = false;
  bool validEmail = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 12,
      ),
      textInputAction: widget.inputAction,
      textCapitalization:
          widget.isCapital ? TextCapitalization.words : TextCapitalization.none,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        fillColor: const Color(0xffF8FAFB),
        filled: true,
        counterText: '',
        contentPadding: const EdgeInsets.only(
          left: 15,
        ),
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
        ),
        errorStyle: const TextStyle(fontSize: 9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.red[700]!,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffF8FAFB),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffF8FAFB),
            width: 1,
          ),
        ),
      ),
    );
  }
}
