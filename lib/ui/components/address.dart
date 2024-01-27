import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({super.key , required this.hint , required this.initialvalue});
  final String hint;
  final String initialvalue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TextFormField(
          cursorHeight: 20,
          validator: (txt) => txt!.isEmpty ? '' : null,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 14),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: initialvalue,
          decoration: InputDecoration(
            hintText: hint,
            errorStyle: const TextStyle(fontSize: 0),
            hintStyle:const  TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 12),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            focusedErrorBorder:const  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
        ),
      ),
    );
  }
}