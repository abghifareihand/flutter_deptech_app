import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_deptech_app/core/extensions/nav_ext.dart';
import 'package:flutter_deptech_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_deptech_app/presentation/agenda/pages/main_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _checkAuthentication();
    super.initState();
  }

  Future<void> _checkAuthentication() async {
    await Future.delayed(const Duration(seconds: 2));
    final isLogin = await AuthLocalDatasource().isLogin();
    final token = await AuthLocalDatasource().getToken();

    if (mounted) {
      if (isLogin) {
        log('Token: $token');
        context.pushReplacement(const MainPage());
      } else {
        log('Token: $token');
        context.pushReplacement(const LoginPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_deptech.png',
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
