import 'package:flutter/material.dart';
import 'package:rekalaba/ui/shared/button_helpers.dart';
import 'package:rekalaba/ui/shared/form_input.dart';
import '../../core/constants/app_colors.dart';
import '../../ui/shared/appbar_helper.dart';
import '../../ui/shared/text_helper.dart';
import '../../ui/shared/ui_helpers.dart';
import 'ppob_register_otp.dart';
import 'widgets/stepper_ppob.dart';

class PpobRegisterInformation extends StatefulWidget {
  const PpobRegisterInformation({Key? key}) : super(key: key);

  @override
  State<PpobRegisterInformation> createState() => _PpobRegisterInformationState();
}

class _PpobRegisterInformationState extends State<PpobRegisterInformation> {
  final ValueNotifier<String> _selectedOtp = ValueNotifier<String>('Whatsapp');
  final ValueNotifier<String?> _selectedProvince = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _selectedCity = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavbar(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const AppBarHelper(
      height: 70,
      title: 'Aktivasi PPOB',
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Stepper
          const StepperPpob(
            title: 'Informasi Personal',
            step: '1',
          ),

          UIHelper.vertSpace(16),

          // Form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FormInput(
              controller: TextEditingController(),
              label: 'Nama Lengkap*',
              textCapitalization: TextCapitalization.words,
              labelStyle: RekaTextStylesV2.textSm.medium.copyWith(
                color: RekaColorsV2.darkNight,
              ),
              hintStyle: RekaTextStylesV2.textSm.medium.copyWith(
                color: RekaColorsV2.disabledText,
              ),
              contentStyle: RekaTextStylesV2.textBase.medium.copyWith(
                color: RekaColorsV2.darkNight,
              ),
              autovalidate: true,
              placeholder: 'cth: John Doe ',
              onTap: () {},
              onChanged: (_) {},
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
            ),
          ),

          UIHelper.vertSpace(16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FormInput(
              controller: TextEditingController(),
              label: 'Nomor HP*',
              keyboardType: TextInputType.number,
              labelStyle: RekaTextStylesV2.textSm.medium.copyWith(
                color: RekaColorsV2.darkNight,
              ),
              hintStyle: RekaTextStylesV2.textSm.medium.copyWith(
                color: RekaColorsV2.disabledText,
              ),
              contentStyle: RekaTextStylesV2.textSm.medium.copyWith(
                color: RekaColorsV2.darkNight,
              ),
              autovalidate: true,
              placeholder: 'cth: 6281234234234',
              onTap: () {},
              onChanged: (_) {},
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
            ),
          ),

          UIHelper.vertSpace(16),

          // Dropdown for OTP method
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ValueListenableBuilder<String>(
              valueListenable: _selectedOtp,
              builder: (BuildContext context, String value, Widget? child) {
                return RekaDropdown(
                  label: 'Kirim Kode OTP Via',
                  labelStyle: RekaTextStylesV2.textSm.medium.copyWith(
                    color: RekaColorsV2.darkNight,
                  ),
                  items: <String>['Whatsapp', 'Email'].map(
                    (String value) {
                      return RekaDropdownItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: RekaTextStylesV2.textSm.semiBold.copyWith(
                            color: RekaColorsV2.darkNight,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (String? newValue) {
                    _selectedOtp.value = newValue!;
                  },
                  value: value,
                );
              },
            ),
          ),

          UIHelper.vertSpace(16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ValueListenableBuilder<String?>(
              valueListenable: _selectedProvince,
              builder: (BuildContext context, String? value, Widget? child) {
                return RekaDropdown(
                  label: 'Provinsi',
                  placeholder: 'Pilih Provinsi',
                  labelStyle: RekaTextStylesV2.textSm.medium.copyWith(
                    color: RekaColorsV2.darkNight,
                  ),
                  items: <RekaDropdownItem<String>>[
                    RekaDropdownItem<String>(
                      value: 'DKI Jakarta',
                      child: Text(
                        'DKI Jakarta',
                        style: RekaTextStylesV2.textSm.semiBold.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ),
                    RekaDropdownItem<String>(
                      value: 'Jawa Barat',
                      child: Text(
                        'Jawa Barat',
                        style: RekaTextStylesV2.textSm.semiBold.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ),
                    RekaDropdownItem<String>(
                      value: 'Jawa Tengah',
                      child: Text(
                        'Jawa Tengah',
                        style: RekaTextStylesV2.textSm.semiBold.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ),
                    RekaDropdownItem<String>(
                      value: 'Jawa Timur',
                      child: Text(
                        'Jawa Timur',
                        style: RekaTextStylesV2.textSm.semiBold.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ),
                    RekaDropdownItem<String>(
                      value: 'Banten',
                      child: Text(
                        'Banten',
                        style: RekaTextStylesV2.textSm.semiBold.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    _selectedProvince.value = newValue;
                  },
                  value: value,
                );
              },
            ),
          ),

          UIHelper.vertSpace(16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ValueListenableBuilder<String?>(
              valueListenable: _selectedCity,
              builder: (BuildContext context, String? value, Widget? child) {
                return RekaDropdown(
                  label: 'Kota/Kabupaten',
                  placeholder: 'Pilih Kota/Kabupaten',
                  labelStyle: RekaTextStylesV2.textSm.medium.copyWith(
                    color: RekaColorsV2.darkNight,
                  ),
                  items: <RekaDropdownItem<String>>[
                    RekaDropdownItem<String>(
                      value: 'Jakarta Selatan',
                      child: Text(
                        'Jakarta Selatan',
                        style: RekaTextStylesV2.textSm.semiBold.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ),
                    RekaDropdownItem<String>(
                      value: 'Jakarta Barat',
                      child: Text(
                        'Jakarta Barat',
                        style: RekaTextStylesV2.textSm.semiBold.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    _selectedCity.value = newValue;
                  },
                  value: value,
                );
              },
            ),
          ),
          UIHelper.vertSpace(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FormInput(
              controller: TextEditingController(),
              label: 'Refferal Code Rekalaba',
              labelStyle: RekaTextStylesV2.textSm.medium.copyWith(
                color: RekaColorsV2.darkNight,
              ),
              hintStyle: RekaTextStylesV2.textSm.medium.copyWith(
                color: RekaColorsV2.disabledText,
              ),
              contentStyle: RekaTextStylesV2.textSm.medium.copyWith(
                color: RekaColorsV2.darkNight,
              ),
              autovalidate: true,
              placeholder: 'REKALABAPPOB',
              disabled: true,
              onTap: () {},
              onChanged: (_) {},
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
            ),
          ),
          UIHelper.vertSpace(16),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: RekaColorsV2.white,
                      border: Border.all(
                        color: RekaColorsV2.darkNight,
                      ),
                    ),
                    child: Checkbox(
                      value: false,
                      onChanged: (bool? value) {
                        // _isCheckedNotifier.value = value ?? false;
                      },
                      checkColor: RekaColorsV2.darkNight,
                      activeColor: Colors.transparent,
                    ),
                  ),
                  UIHelper.horzSpace(8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Dengan mendaftar, Kamu sudah menyetujui ',
                            style: RekaTextStylesV2.textXs.regular.copyWith(
                              color: RekaColorsV2.darkNight,
                            ),
                          ),
                          TextSpan(
                            text: 'Syarat & Ketentuan ',
                            style: RekaTextStylesV2.textXs.semiBold.copyWith(
                              color: RekaColorsV2.darkNight, // Warna teks Syarat & Ketentuan
                            ),
                          ),
                          TextSpan(
                            text: 'dan ',
                            style: RekaTextStylesV2.textXs.regular.copyWith(
                              color: RekaColorsV2.darkNight,
                            ),
                          ),
                          TextSpan(
                            text: 'Kebijakan Privasi.',
                            style: RekaTextStylesV2.textXs.semiBold.copyWith(
                              color: RekaColorsV2.darkNight, // Warna teks Syarat & Ketentuan
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavbar(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        child: RekaPrimaryButton(
          text: 'Kirim Kode OTP',
          size: ButtonSize.small,
          onPressed: () {
            Navigator.push(
              context,
              RekaRoute<dynamic>(
                builder: (BuildContext context) => const PpobRegisterOtp(),
              ),
            );
          },
        ),
      ),
    );
  }
}
