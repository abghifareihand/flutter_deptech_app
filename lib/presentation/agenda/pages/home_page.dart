import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/core/extensions/nav_ext.dart';
import 'package:flutter_deptech_app/presentation/agenda/widgets/list_agenda_card.dart';
import '../../auth/bloc/user/user_bloc.dart';
import '../bloc/get_agenda/get_agenda_bloc.dart';
import 'agenda_create_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const SizedBox(
            height: 30.0,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return Text(
                  'Halo, ${state.userResponse.user!.firstName}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }
              return const Text(
                'Halo,',
                style: TextStyle(
                  fontSize: 16,
                ),
              );
            },
          ),

          /// List agenda
          BlocBuilder<GetAgendaBloc, GetAgendaState>(
            builder: (context, state) {
              if (state is GetAgendaLoaded) {
                final agendas = state.agendaResponse.data;

                if (agendas!.isEmpty) {
                  return const SizedBox();
                }
                return ListView.builder(
                  itemCount: agendas.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final agenda = agendas[index];
                    return ListAgendaCard(agenda: agenda);
                  },
                );
              }

              if (state is GetAgendaLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const AgendaCreatePage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
