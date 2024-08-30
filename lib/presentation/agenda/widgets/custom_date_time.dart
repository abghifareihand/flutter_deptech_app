import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateTime extends StatefulWidget {
  final String label;
  final DateTime? initialDateTime;
  final ValueChanged<DateTime?> onDateTimeChanged;
  final ValueNotifier<DateTime?> controller;
  final String? Function(DateTime?)? validator; // Optional validator function

  const CustomDateTime({
    super.key,
    required this.label,
    this.initialDateTime,
    required this.onDateTimeChanged,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomDateTime> createState() => _CustomDateTimeState();
}

class _CustomDateTimeState extends State<CustomDateTime> {
  late ValueNotifier<DateTime?> _dateTimeNotifier;
  late ValueNotifier<DateTime?> _dateNotifier;
  late ValueNotifier<TimeOfDay?> _timeNotifier;

  @override
  void initState() {
    super.initState();
    _dateTimeNotifier = widget.controller;
    _dateNotifier = ValueNotifier(widget.initialDateTime);
    _timeNotifier = ValueNotifier(widget.initialDateTime != null ? TimeOfDay.fromDateTime(widget.initialDateTime!) : null);
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateNotifier.value ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      _dateNotifier.value = picked;
      // after selecting the date, then select the time
      _selectTime();
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeNotifier.value ?? TimeOfDay.now(),
    );

    if (picked != null) {
      _timeNotifier.value = picked;
      _updateDateTime();
    }
  }

  void _updateDateTime() {
    if (_dateNotifier.value != null && _timeNotifier.value != null) {
      final dateTime = DateTime(
        _dateNotifier.value!.year,
        _dateNotifier.value!.month,
        _dateNotifier.value!.day,
        _timeNotifier.value!.hour,
        _timeNotifier.value!.minute,
      );

      _dateTimeNotifier.value = dateTime;
      widget.onDateTimeChanged(dateTime);
    }
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'Select date time';
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');
    return '${dateFormat.format(dateTime)} ${timeFormat.format(dateTime)}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          InkWell(
            onTap: _selectDate,
            child: ValueListenableBuilder<DateTime?>(
              valueListenable: _dateTimeNotifier,
              builder: (context, selectedDateTime, _) {
                final validationError = widget.validator?.call(selectedDateTime);
                return InputDecorator(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 12.0,
                    ),
                    suffixIcon: InkWell(
                      onTap: _selectDate,
                      child: const Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ),
                    ),
                    errorText: validationError, // Show validation error
                  ),
                  child: Text(
                    _formatDateTime(selectedDateTime),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: selectedDateTime != null ? Colors.black : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
