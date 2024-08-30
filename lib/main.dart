import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/data/datasources/notification_service.dart';
import 'package:flutter_deptech_app/presentation/agenda/bloc/add_agenda/add_agenda_bloc.dart';
import 'package:flutter_deptech_app/presentation/agenda/bloc/update_agenda/update_agenda_bloc.dart';
import 'package:flutter_deptech_app/presentation/auth/bloc/upload_photo/upload_photo_bloc.dart';
import 'package:flutter_deptech_app/presentation/auth/pages/splash_page.dart';

import 'presentation/agenda/bloc/delete_agenda/delete_agenda_bloc.dart';
import 'presentation/agenda/bloc/get_agenda/get_agenda_bloc.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/auth/bloc/user/user_bloc.dart';

void main() async {
  runApp(const MyApp());
  await NotificationService.initializeNotification();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // AUTH
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => UploadPhotoBloc(),
        ),

        // AGENDA
        BlocProvider(
          create: (context) => AddAgendaBloc(),
        ),
        BlocProvider(
          create: (context) => GetAgendaBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteAgendaBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateAgendaBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
