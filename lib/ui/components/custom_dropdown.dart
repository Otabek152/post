import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> languages = {
      'Uzbek lotincha': 'assets/images/uzb.png',
      'Узбек Кирил': 'assets/images/uzb.png',
      'Русский': 'assets/images/images.png'
    };
    String dropdown = 'Uzbek lotincha';
    return SizedBox(
      height: 200,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            hint:  Row(
              children: [
                SizedBox(height: 24,width: 24,child: Image.asset('assets/images/uzb.png'),),
                SizedBox(width: 10,),

                Text(dropdown),
              ],
            ),
            items: languages.entries
                .map((e) => DropdownMenuItem<String>(
                      value: e.key,
                      child: Row(
                        children: [
                          SizedBox(
                              height: 24,
                              width: 24,
                              child: Image.asset(e.value)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e.key,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Choose a language';
              }
              return null;
            },
            onChanged: (value) {
              if (value.toString() == 'Uzbek lotincha') {
                context.setLocale(const Locale('uzblot', 'UZB'));
              } else if (value.toString() == 'Узбек Кирил') {
                context.setLocale(const Locale('uzbkr', 'UZB'));
              } else if (value.toString() == 'Русский') {
                context.setLocale(const Locale('rus', 'RUS'));
              }
            },
            onSaved: (value) {
              dropdown = value.toString();

              print(value);
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: IconStyleData(
              icon: SvgPicture.asset('assets/icons/chevron-down.svg'),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }
}
