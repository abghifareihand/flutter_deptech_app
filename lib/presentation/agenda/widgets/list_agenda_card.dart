import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/core/extensions/nav_ext.dart';
import 'package:flutter_deptech_app/data/models/response/agenda_list_response_model.dart';
import 'package:flutter_deptech_app/presentation/agenda/pages/agenda_edit_page.dart';
import 'package:intl/intl.dart';

import '../bloc/delete_agenda/delete_agenda_bloc.dart';
import '../bloc/get_agenda/get_agenda_bloc.dart';

class ListAgendaCard extends StatelessWidget {
  final Agenda agenda;
  const ListAgendaCard({
    super.key,
    required this.agenda,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AgendaEditPage(agenda: agenda));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Event time :',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      formatDateTime(agenda.eventDatetime!),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    context.read<DeleteAgendaBloc>().add(DeleteAgenda(id: agenda.id!));
                    context.read<GetAgendaBloc>().add(GetAgenda());
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Title :',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              agenda.title!,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Reminder :',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              agenda.reminderDatetime != null ? formatDateTime(agenda.reminderDatetime!) : 'No reminder set', // atau bisa juga '' untuk teks kosong
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');
    return formatter.format(dateTime);
  }
}
