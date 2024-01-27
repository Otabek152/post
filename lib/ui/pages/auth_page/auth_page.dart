import 'package:flutter/material.dart';
import 'package:post_project/ui/pages/auth_page/auth_page_body.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthPageBody(),
    );
  }
}