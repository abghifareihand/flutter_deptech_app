import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:rekalaba/screens/ppob/layanan/paket_data/paket_data_select_nominal.dart';
import 'package:rekalaba/screens/ppob/layanan/paket_sms/paket_sms_select_nominal.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/button_helpers.dart';
import '../../../../ui/shared/form_input.dart';
import '../../../../ui/shared/text_helper.dart';
import '../../../../ui/shared/ui_helpers.dart';

class PaketSmsInputNumber extends StatefulWidget {
  const PaketSmsInputNumber({Key? key}) : super(key: key);

  @override
  State<PaketSmsInputNumber> createState() => _PaketSmsInputNumberState();
}

class _PaketSmsInputNumberState extends State<PaketSmsInputNumber> {
  final TextEditingController _numberController = TextEditingController();
  final ValueNotifier<bool> _isButtonDisable = ValueNotifier<bool>(true);
  final FlutterContactPicker _contactPicker = FlutterContactPicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Paket SMS',
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavbar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _inputNumber(),
        ],
      ),
    );
  }

  Padding _inputNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: FormInput(
        controller: _numberController
          ..addListener(() {
            _isButtonDisable.value = _numberController.text.isEmpty;
          }),
        keyboardType: TextInputType.number,
        label: 'Masukkan Nomor HP',
        labelStyle: RekaTextStylesV2.textBase.medium.copyWith(
          fontSize: 14,
          color: RekaColorsV2.darkNight,
        ),
        hintStyle: RekaTextStylesV2.textBase.medium.copyWith(
          fontSize: 14,
          color: RekaColorsV2.disabledText,
        ),
        contentStyle: RekaTextStylesV2.textBase.medium.copyWith(
          color: RekaColorsV2.darkNight,
        ),
        autovalidate: true,
        placeholder: 'cth: 082123123123',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IntrinsicHeight(
            child: ValueListenableBuilder<bool>(
              valueListenable: _isButtonDisable,
              builder: (BuildContext context, bool isDisabled, Widget? child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Icon clear number
                    if (!isDisabled) ...<Widget>[
                      InkWell(
                        child: const Icon(Icons.clear),
                        onTap: () {
                          _numberController.clear();
                        },
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],

                    // Icon get contact device user
                    InkWell(
                      child: const Icon(Icons.contacts),
                      onTap: () async {
                        final Contact? contact = await _contactPicker.selectContact();
                        if (contact != null && contact.phoneNumbers!.isNotEmpty) {
                          final String formattedNumber = formatPhoneNumber(contact.phoneNumbers!.first);
                          _numberController.text = formattedNumber;
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavbar(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        child: ValueListenableBuilder<bool>(
          valueListenable: _isButtonDisable,
          builder: (BuildContext context, bool isDisabled, Widget? child) {
            return RekaPrimaryButton(
              text: 'Lanjutkan',
              size: ButtonSize.small,
              onPressed: isDisabled
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        RekaRoute<dynamic>(
                          builder: (BuildContext context) => PaketSmsSelectNominal(
                            number: _numberController.text,
                          ),
                        ),
                      );
                    },
            );
          },
        ),
      ),
    );
  }

  String formatPhoneNumber(String phoneNumber) {
    // Menghapus semua karakter non-digit
    final String cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (cleaned.startsWith('0')) {
      return cleaned; // Jika dimulai dengan 0, kembalikan seperti semula
    } else if (cleaned.startsWith('62')) {
      return '0${cleaned.substring(2)}'; // Jika dimulai dengan 62, ganti jadi 0xxxx
    } else if (cleaned.startsWith('812')) {
      return '628${cleaned.substring(1)}'; // Jika dimulai dengan 812, tambahkan 628
    } else {
      return cleaned; // Kembalikan cleaned jika tidak sesuai
    }
  }
}
