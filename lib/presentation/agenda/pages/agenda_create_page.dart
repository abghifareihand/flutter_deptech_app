import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/core/components/custom_button.dart';
import 'package:flutter_deptech_app/core/components/custom_snackbar.dart';
import 'package:flutter_deptech_app/core/extensions/nav_ext.dart';
import 'package:flutter_deptech_app/data/models/request/agenda_request_model.dart';
import 'package:flutter_deptech_app/presentation/agenda/bloc/add_agenda/add_agenda_bloc.dart';
import 'package:flutter_deptech_app/presentation/agenda/bloc/get_agenda/get_agenda_bloc.dart';

import '../../../core/components/custom_dialog.dart';
import '../../../core/components/custom_field.dart';
import '../../../data/datasources/notification_service.dart';
import '../widgets/custom_date_time.dart';

class AgendaCreatePage extends StatefulWidget {
  const AgendaCreatePage({super.key});

  @override
  State<AgendaCreatePage> createState() => _AgendaCreatePageState();
}

class _AgendaCreatePageState extends State<AgendaCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateTimeNotifier = ValueNotifier<DateTime?>(null);
  final _reminderTimeNotifier = ValueNotifier<DateTime?>(null);
  final _reminderSwitchNotifier = ValueNotifier<bool>(false);
  final _reminderOptionNotifier = ValueNotifier<String>('None');
  File? _attachment;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateTimeNotifier.dispose();
    _reminderTimeNotifier.dispose();
    _reminderSwitchNotifier.dispose();
    _reminderOptionNotifier.dispose();
    super.dispose();
  }

  Future<void> _pickAttachment() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _attachment = File(result.files.first.path!);
      });
    }
  }

  DateTime? _calculateReminderTime(DateTime eventDateTime, String option) {
    switch (option) {
      case '1 day earlier':
        return eventDateTime.subtract(const Duration(days: 1));
      case '3 hours earlier':
        return eventDateTime.subtract(const Duration(hours: 3));
      case '1 hour earlier':
        return eventDateTime.subtract(const Duration(hours: 1));
      case '2 minute earlier':
        return eventDateTime.subtract(const Duration(minutes: 2));
      default:
        return null;
    }
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      final eventDateTime = _dateTimeNotifier.value!;
      final reminderTime = _reminderSwitchNotifier.value ? _calculateReminderTime(eventDateTime, _reminderOptionNotifier.value) : null;

      final agenda = AgendaRequest(
        title: _titleController.text,
        description: _descriptionController.text,
        eventDateTime: eventDateTime,
        attachment: _attachment,
        reminderDateTime: reminderTime,
      );

      if (reminderTime != null) {
        NotificationService.showScheduleNotifications(
          scheduledDate: reminderTime,
          body: _titleController.text,
        );
      }

      context.read<AddAgendaBloc>().add(AddAgenda(agendaRequest: agenda));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Agenda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomDateTime(
                label: 'Event Date & Time',
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (dateTime) {
                  _dateTimeNotifier.value = dateTime;
                },
                controller: _dateTimeNotifier,
                validator: (dateTime) {
                  if (dateTime == null) {
                    return 'Please select a date and time';
                  }
                  return null;
                },
              ),
              CustomField.text(
                label: 'Title',
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              CustomField.comment(
                label: 'Description',
                controller: _descriptionController,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const Text(
                'Attachment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              InkWell(
                onTap: _pickAttachment,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _attachment != null ? Colors.green : Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                    color: _attachment != null ? Colors.green[100] : Colors.grey[200],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              _attachment != null ? _attachment!.path.split('/').last : 'Upload File',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: _attachment != null ? Colors.green : Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Icon(
                            _attachment != null ? Icons.check_circle : Icons.warning,
                            color: _attachment != null ? Colors.green : Colors.grey,
                          ),
                        ],
                      ),
                      if (_attachment != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Uploaded on: ${DateTime.now().toLocal().toString().split('.')[0]}',
                            style: const TextStyle(fontSize: 12.0, color: Colors.black54),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ValueListenableBuilder<bool>(
                valueListenable: _reminderSwitchNotifier,
                builder: (context, isReminderEnabled, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitchListTile(
                        title: const Text('Set Reminder'),
                        value: isReminderEnabled,
                        onChanged: (value) {
                          _reminderSwitchNotifier.value = value;
                        },
                      ),
                      if (isReminderEnabled) ...[
                        const Text('Reminder Time'),
                        DropdownButton<String>(
                          value: _reminderOptionNotifier.value,
                          items: const [
                            DropdownMenuItem(value: 'None', child: Text('None')),
                            DropdownMenuItem(value: '1 day earlier', child: Text('1 day earlier')),
                            DropdownMenuItem(value: '3 hours earlier', child: Text('3 hours earlier')),
                            DropdownMenuItem(value: '1 hour earlier', child: Text('1 hour earlier')),
                            DropdownMenuItem(value: '2 minute earlier', child: Text('2 minute earlier')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _reminderOptionNotifier.value = value;
                              });
                            }
                          },
                        ),
                      ],
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              BlocConsumer<AddAgendaBloc, AddAgendaState>(
                listener: (context, state) {
                  if (state is AddAgendaLoaded) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          icon: Icons.check_circle,
                          title: 'Success',
                          message: state.agendaResponse.message!,
                          onDonePressed: () {
                            context.pop();
                            context.pop();
                          },
                        );
                      },
                    );
                    context.read<GetAgendaBloc>().add(GetAgenda());
                  }

                  if (state is AddAgendaError) {
                    showErrorSnackbar(context, state.message);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onPressed: _validateForm,
                    text: 'Add Agenda',
                    isLoading: state is AddAgendaLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
