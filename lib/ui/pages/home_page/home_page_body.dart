import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:post_project/ui/components/custom_dropdown.dart';
import 'package:post_project/ui/pages/auth_page/auth_page.dart';
import 'package:post_project/ui/theme/app_colors.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/FindSport-Logo.svg'),
            const SizedBox(
              width: 12,
            ),
            const Text(
              'FindSport',
              style: TextStyle(fontFamily: 'K2D', fontSize: 36),
            )
          ],
        ),
        SizedBox(
          width: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('Languages')]),
              const SizedBox(
                height: 5,
              ),
              const CustomDropDown(),
              CircleAvatar(
                  backgroundColor: AppColors.buttonColor,
                  radius: 24,
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const AuthPage(),
                            ));
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 24,
                      )))
            ],
          ),
        )
      ],
    );
  }
}
