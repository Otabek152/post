// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:post_project/generated/locale_keys.g.dart';
// import 'package:post_project/ui/pages/ads_page/ads_page_body.dart';

// class AdsPage extends StatefulWidget {
//   const AdsPage({super.key});

//   @override
//   State<AdsPage> createState() => _AdsPageState();
// }

// class _AdsPageState extends State<AdsPage> {
//   TextEditingController title = TextEditingController();
//   TextEditingController description = TextEditingController();
//   String address = '';
//   double lon = 0, lat = 0;
//   @override
//   void initState() {
//     Geolocator.getCurrentPosition().then((value) {
//       lon = value.longitude;
//       lat = value.latitude;
//     });
//     // List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
//     // Placemark firsresult = placemarks.first;

//     // address =
//     //     '${firsresult.country}/${firsresult.locality}/${firsresult.subLocality}';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 1,
//           backgroundColor: Colors.white,
//           leading: const Icon(Icons.close),
//           title: Text(LocaleKeys.Newads.tr()),
//           actions: [
//             IconButton(
//               onPressed: () async {
//                 print(description.text);
//               },
//               icon: const Icon(Icons.arrow_forward),
//               color: Colors.blue,
//             )
//           ],
//         ),
//         body: Form(
//             key: formKey,
//             child: AdsPageBody(
//               initialvalue: address,
//               description: description,
//               title: title,
//             )),
//       ),
//     );
//   }
// }
