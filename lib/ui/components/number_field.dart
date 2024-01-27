import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:post_project/generated/locale_keys.g.dart';

class NumberField extends StatelessWidget {
  const NumberField({super.key , required this.musk});
  final musk;
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 38,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TextFormField(
          inputFormatters: [musk],
          initialValue: '+998 (',
          keyboardType: TextInputType.number,
          validator: (value) => value!.length < 19 ? '' : null,
          style: const TextStyle(fontSize: 14),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            errorStyle: TextStyle(fontSize: 0),
            contentPadding: EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 12),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            filled: false,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            hintText: LocaleKeys.FirstName,
            hintStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
        ),
      ),
    );
  }
}
