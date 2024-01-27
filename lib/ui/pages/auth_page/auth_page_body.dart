import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:post_project/domen/bloc/auth_bloc.dart';
import 'package:post_project/generated/locale_keys.g.dart';
import 'package:post_project/ui/components/custom_input_field.dart';
import 'package:post_project/ui/components/number_field.dart';
import 'package:post_project/ui/pages/ads_page/ads_page.dart';
import 'package:post_project/ui/pages/ads_page/ads_page_body.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    var musk = MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
    );
    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: ListView(
        children: [
          SizedBox(
            height: 300,
            width: 281,
            child: Image.asset('assets/images/auth_img.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.SignUp.tr(),
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.FirstName.tr()),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: CustomInputField(
                    controller: firstName,
                    hint:
                        '${LocaleKeys.Enter.tr()} ${LocaleKeys.FirstName.tr()}',
                  ),
                ),
                Text(LocaleKeys.LastName.tr()),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: CustomInputField(
                    controller: lastName,
                    hint:
                        '${LocaleKeys.Enter.tr()} ${LocaleKeys.LastName.tr()}',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(LocaleKeys.Phonenumber.tr()),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: NumberField(musk: musk),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(LocaleKeys.Password.tr()),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: CustomInputField(
                    controller: password,
                    hint:
                        '${LocaleKeys.Enter.tr()} ${LocaleKeys.Password.tr()}',
                  ),
                ),
                Text(LocaleKeys.Confirmpassword.tr()),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: CustomInputField(
                    controller: confirmPassword,
                    hint: '${LocaleKeys.Confirmpassword.tr()}',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 40,
                    width: double.infinity,
                    child: FloatingActionButton(
                      onPressed: () {
                        final form = formKey.currentState!;

                        if (form.validate() &&
                            password.text == confirmPassword.text) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => AdsPageBody(),
                              ));
                          context.read<AuthBloc>().add(AuthRegister(
                              firstName: firstName.text,
                              lastName: lastName.text,
                              password: password.text,
                              phoneNumber: musk.getMaskedText()));
                        } else if (password.text != confirmPassword.text) {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Passwords not matching'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ));
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                  colors: [Color(0xFF01001FAD).withOpacity(0.68), Color(0xFF01001F)])),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(LocaleKeys.Save.tr())),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
