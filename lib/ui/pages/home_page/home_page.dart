import 'package:flutter/material.dart';
import 'package:post_project/ui/pages/home_page/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
    );
  }
}