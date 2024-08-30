import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/core/components/custom_button.dart';
import 'package:flutter_deptech_app/data/models/response/agenda_list_response_model.dart';
import 'package:flutter_deptech_app/presentation/agenda/bloc/get_agenda/get_agenda_bloc.dart';
import 'package:flutter_deptech_app/presentation/agenda/bloc/update_agenda/update_agenda_bloc.dart';

import '../../../core/components/custom_field.dart';
import '../../../core/components/custom_snackbar.dart';
import '../widgets/custom_date_time.dart';

class AgendaEditPage extends StatefulWidget {
  final Agenda agenda;
  const AgendaEditPage({super.key, required this.agenda});

  @override
  State<AgendaEditPage> createState() => _AgendaEditPageState();
}

class _AgendaEditPageState extends State<AgendaEditPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late ValueNotifier<DateTime?> _dateTimeNotifier;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.agenda.title);
    _descriptionController = TextEditingController(text: widget.agenda.description);
    _dateTimeNotifier = ValueNotifier<DateTime?>(widget.agenda.eventDatetime);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateTimeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Agenda'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomDateTime(
            label: 'Event Date & Time',
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (dateTime) {
              _dateTimeNotifier.value = dateTime;
            },
            controller: _dateTimeNotifier,
          ),
          CustomField.text(
            label: 'Title',
            controller: _titleController,
          ),
          CustomField.comment(
            label: 'Description',
            controller: _descriptionController,
            maxLines: 4,
          ),
          const SizedBox(
            height: 20.0,
          ),
          BlocConsumer<UpdateAgendaBloc, UpdateAgendaState>(
            listener: (context, state) {
              if (state is UpdateAgendaLoaded) {
                showSuccessSnackbar(context, state.agendaResponse.message!);
              }
            },
            builder: (context, state) {
              return CustomButton(
                onPressed: () {
                  context.read<UpdateAgendaBloc>().add(UpdateAgenda(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        id: widget.agenda.id!,
                      ));

                  context.read<GetAgendaBloc>().add(GetAgenda());
                },
                text: 'Save',
                isLoading: state is UpdateAgendaLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
