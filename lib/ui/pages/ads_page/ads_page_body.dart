import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:post_project/domen/bloc/auth_bloc.dart';
import 'package:post_project/domen/map/app_lat_long.dart';
import 'package:post_project/domen/map/location_service.dart';
import 'package:post_project/generated/locale_keys.g.dart';
import 'package:post_project/ui/components/address.dart';
import 'package:post_project/ui/components/custom_input_field.dart';
import 'package:post_project/ui/components/custom_map.dart';
import 'package:post_project/ui/components/description_field.dart';
import 'package:post_project/ui/pages/home_page/home_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AdsPageBody extends StatefulWidget {
  const AdsPageBody({super.key});
  @override
  State<AdsPageBody> createState() => _AdsPageBodyState();
}

class _AdsPageBodyState extends State<AdsPageBody> {
  double lon = 0, lat = 0;
  final formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String address = '';

  Future<void> convert() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    Placemark firsresult = placemarks.first;
    setState(() {
      address =
          '${firsresult.country}/${firsresult.locality}/${firsresult.subLocality}';
    });
  }

  @override
  void initState() {
    Geolocator.getCurrentPosition().then((value) {
      lon = value.longitude;
      lat = value.latitude;
    });
    convert();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: const Icon(Icons.close),
          title: Text(LocaleKeys.Newads.tr()),
          actions: [
            IconButton(
              onPressed: () async {
                final form = formKey.currentState!;
                List<Placemark> placemarks =
                    await placemarkFromCoordinates(lat, lon);
                Placemark firsresult = placemarks.first;
                address =
                    '${firsresult.country}/${firsresult.locality}/${firsresult.subLocality}';
                if (form.validate()) {
                  print('${description.text} ${title.text} ${lat.toString()} ${lon.toString()}');
                  context.read<AuthBloc>().add(AuthAds(
                    description: description.text,
                    title: title.text,
                    lat: lat,
                    lot: lon ,
                  ));
                  // Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage(),));
                }
              },
              icon: const Icon(Icons.arrow_forward),
              color: Colors.blue,
            )
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 32, right: 24, left: 24, bottom: 22),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.Title.tr()),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomInputField(
                      controller: title,
                      hint: '${LocaleKeys.Enter.tr()} ${LocaleKeys.Title.tr()}',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(LocaleKeys.Description.tr()),
                    const SizedBox(
                      height: 5,
                    ),
                    DescriptionField(
                        controller: description,
                        hint:
                            '${LocaleKeys.Enter.tr()} ${LocaleKeys.Description.tr()}'),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(LocaleKeys.Changelocation.tr()),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            width: 1,
                            height: 1,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(LocaleKeys.Addressbylocation.tr()),
                    const SizedBox(
                      height: 5,
                    ),
                    Address(
                      hint:
                          '${LocaleKeys.Enter.tr()} ${LocaleKeys.Addressbylocation.tr()}',
                      initialvalue: address,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 300, width: 300, child: CustomMap()),
          ],
        ),
      ),
    );
  }
}
