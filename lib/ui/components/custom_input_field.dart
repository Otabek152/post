import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:post_project/generated/locale_keys.g.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key , required this.controller , required this.hint});
  final controller;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TextFormField(
          controller: controller,
          cursorHeight: 20,
          validator: (txt) => txt!.isEmpty ? '' : null,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 14),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          
          decoration: InputDecoration(
            hintText: hint,
            errorStyle: TextStyle(fontSize: 0),
            hintStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 12),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
        ),
      ),
    );
  }
}
