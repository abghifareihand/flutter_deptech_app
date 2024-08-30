import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/core/extensions/nav_ext.dart';
import 'package:flutter_deptech_app/data/models/request/register_request_model.dart';
import 'package:flutter_deptech_app/presentation/agenda/pages/main_page.dart';
import 'package:flutter_deptech_app/presentation/auth/widgets/select_gender.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_field.dart';
import '../../../core/components/custom_date.dart';
import '../../../core/components/custom_snackbar.dart';
import '../bloc/register/register_bloc.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier<DateTime?>(null);
  final ValueNotifier<String?> _selectedGender = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _selectedGender.dispose();
    _selectedDate.dispose();
    super.dispose();
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
                'Register',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomField.text(
              controller: _firstnameController,
              label: 'Firstname',
            ),
            CustomField.text(
              controller: _lastnameController,
              label: 'Lastname',
            ),
            CustomField.email(
              controller: _emailController,
              label: 'Email',
            ),
            CustomDate(
              label: 'Birthdate',
              controller: _selectedDate,
              initialDate: DateTime.now(),
              onDateChanged: (newDate) {
                _selectedDate.value = newDate;
              },
            ),
            SelectGender(
              controller: _selectedGender,
            ),
            CustomField.password(
              controller: _passwordController,
              label: 'Password',
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoaded) {
                  context.push(const MainPage());
                  showSuccessSnackbar(context, state.authResponse.message ?? '-');
                }

                if (state is RegisterError) {
                  showErrorSnackbar(context, state.message);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  onPressed: () {
                    DateTime selectedDateTime = DateTime(
                      _selectedDate.value!.year,
                      _selectedDate.value!.month,
                      _selectedDate.value!.day,
                    );
                    final register = RegisterRequest(
                      firstName: _firstnameController.text,
                      lastName: _lastnameController.text,
                      email: _emailController.text,
                      birthdate: selectedDateTime.toString(),
                      gender: _selectedGender.value!,
                      password: _passwordController.text,
                    );

                    context.read<RegisterBloc>().add(Register(registerRequest: register));
                  },
                  text: 'Register',
                  isLoading: state is RegisterLoading,
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
                  'Already have an account? ',
                ),
                GestureDetector(
                  onTap: () {
                    context.push(const LoginPage());
                  },
                  child: const Text(
                    'Login',
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
