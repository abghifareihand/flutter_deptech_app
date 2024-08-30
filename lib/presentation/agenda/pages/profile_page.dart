import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/core/components/pick_image.dart';
import 'package:flutter_deptech_app/core/extensions/nav_ext.dart';
import 'package:flutter_deptech_app/presentation/auth/bloc/upload_photo/upload_photo_bloc.dart';
import 'package:flutter_deptech_app/presentation/auth/bloc/user/user_bloc.dart';
import 'package:flutter_deptech_app/presentation/agenda/pages/profile_edit_page.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_snackbar.dart';
import '../../../core/constants/variables.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/pages/login_page.dart';
import '../widgets/menu_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(
            height: 40.0,
          ),
          // Profile
          BlocListener<UploadPhotoBloc, UploadPhotoState>(
            listener: (context, state) {
              context.read<UserBloc>().add(GetUser());
            },
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoading || state is UploadPhotoLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UserLoaded) {
                  final user = state.userResponse.user;
                  return Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: user!.profilePicture != null && user.profilePicture!.isNotEmpty
                                  ? CachedNetworkImageProvider(
                                      '${Variables.baseUrl}${user.profilePicture}',
                                    )
                                  : const AssetImage('assets/images/avatar.png') as ImageProvider,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 100,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            pickImage(
                              context,
                              ImageSource.gallery,
                              onImagePicked: (File imageFile) {
                                setState(() {
                                  file = imageFile;
                                });
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return MenuProfile(
                  icon: Icons.person,
                  title: 'Edit Profile',
                  onTap: () {
                    context.push(ProfileEditPage(user: state.userResponse));
                  },
                );
              }
              return MenuProfile(
                icon: Icons.person,
                title: 'Edit Profile',
                onTap: () {},
              );
            },
          ),
          MenuProfile(
            icon: Icons.privacy_tip,
            title: 'Privacy & Policy',
            onTap: () {},
          ),
          MenuProfile(
            icon: Icons.info,
            title: 'About App',
            onTap: () {},
          ),
          MenuProfile(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {},
          ),
          const SizedBox(
            height: 20.0,
          ),
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state is LogoutLoaded) {
                context.pushAndRemoveUntil(
                  const LoginPage(),
                  (route) => false,
                );
                showSuccessSnackbar(context, state.message);
              }

              if (state is LogoutError) {
                showErrorSnackbar(context, state.message);
              }
            },
            builder: (context, state) {
              return CustomButton(
                onPressed: () {
                  context.read<LogoutBloc>().add(Logout());
                },
                text: 'Logout',
                isLoading: state is LogoutLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
