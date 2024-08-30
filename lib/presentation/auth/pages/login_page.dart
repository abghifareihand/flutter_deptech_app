import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/core/extensions/nav_ext.dart';
import 'package:flutter_deptech_app/data/models/request/login_request_model.dart';
import 'package:flutter_deptech_app/presentation/agenda/pages/main_page.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_field.dart';
import '../../../core/components/custom_snackbar.dart';
import '../bloc/login/login_bloc.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      final login = LoginRequest(
        email: _emailController.text,
        password: _passwordController.text,
      );
      context.read<LoginBloc>().add(Login(loginRequest: login));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomField.email(
              controller: _emailController,
              label: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a email';
                }
                return null;
              },
            ),
            CustomField.password(
              controller: _passwordController,
              label: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginLoaded) {
                  context.push(const MainPage());
                  showSuccessSnackbar(context, state.authResponse.message ?? '-');
                }

                if (state is LoginError) {
                  showErrorSnackbar(context, state.message);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  onPressed: _validateForm,
                  text: 'Login',
                  isLoading: state is LoginLoading,
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have an account? ',
                ),
                GestureDetector(
                  onTap: () {
                    context.push(const RegisterPage());
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
