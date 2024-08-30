import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/core/components/custom_button.dart';
import 'package:flutter_deptech_app/core/components/custom_date.dart';
import 'package:flutter_deptech_app/data/models/request/user_request_model.dart';
import 'package:flutter_deptech_app/data/models/response/user_response_model.dart';
import 'package:flutter_deptech_app/presentation/auth/widgets/select_gender.dart';

import '../../../core/components/custom_field.dart';
import '../../../core/components/custom_snackbar.dart';
import '../../auth/bloc/user/user_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  final UserResponse user;
  const ProfileEditPage({super.key, required this.user});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late ValueNotifier<DateTime?> _selectedDate;
  late ValueNotifier<String?> _selectedGender;

  @override
  void initState() {
    super.initState();
    _firstnameController = TextEditingController(text: widget.user.user!.firstName);
    _lastnameController = TextEditingController(text: widget.user.user!.lastName);
    _emailController = TextEditingController(text: widget.user.user!.email);
    _passwordController = TextEditingController();
    _selectedDate = ValueNotifier<DateTime?>(widget.user.user!.birthdate);
    _selectedGender = ValueNotifier<String?>(widget.user.user!.gender);
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _selectedDate.dispose();
    _selectedGender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
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
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserLoaded) {
                showSuccessSnackbar(context, state.userResponse.message!);
              }
            },
            builder: (context, state) {
              return CustomButton(
                onPressed: () {
                  final update = UserRequest(
                    firstName: _firstnameController.text.isNotEmpty ? _firstnameController.text : null,
                    lastName: _lastnameController.text.isNotEmpty ? _lastnameController.text : null,
                    email: _emailController.text.isNotEmpty ? _emailController.text : null,
                    birthdate: _selectedDate.value?.toString(),
                    gender: _selectedGender.value,
                    password: _passwordController.text.isNotEmpty ? _passwordController.text : null,
                  );
                  context.read<UserBloc>().add(UpdateUser(userRequest: update));
                },
                text: 'Save',
                isLoading: state is UserLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
