import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rekalaba/screens/ppob/widgets/stepper_ppob.dart';
import '../../core/constants/app_colors.dart';
import '../../ui/shared/appbar_helper.dart';
import '../../ui/shared/button_helpers.dart';
import '../../ui/shared/text_helper.dart';
import '../../ui/shared/ui_helpers.dart';
import 'ppob_register_pin.dart';

class PpobRegisterOtp extends StatelessWidget {
  const PpobRegisterOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Aktivasi PPOB',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Stepper
          const StepperPpob(
            title: 'Input OTP',
            step: '2',
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Masukkan Kode OTP',
                  style: RekaTextStylesV2.textLg.semiBold.copyWith(
                    color: RekaColorsV2.darkNight,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Kode OTP 4 digit sudah kami kirimkan di nomor whatsapp ',
                        style: RekaTextStylesV2.textSm.regular.copyWith(
                          color: RekaColorsV2.disabledText,
                        ),
                      ),
                      TextSpan(
                        text: '+6284569236093',
                        style: RekaTextStylesV2.textXs.semiBold.copyWith(
                          color: RekaColorsV2.bluePrimary, // Warna teks Syarat & Ketentuan
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),

                // OTP
                SizedBox(
                  width: double.infinity,
                  child: Pinput(
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 2,
                          height: 24,
                          color: RekaColorsV2.darkNight,
                        ),
                      ],
                    ),
                    length: 4,
                    separatorBuilder: (_) => const SizedBox(width: 24),
                    defaultPinTheme: PinTheme(
                      width: 69,
                      height: 69,
                      textStyle: RekaTextStylesV2.text2Xl.bold.copyWith(
                        color: RekaColorsV2.darkNight,
                      ),
                      decoration: BoxDecoration(
                        color: RekaColorsV2.bgPlaceHolder,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          child: RekaPrimaryButton(
            text: 'Aktivasi Sekarang',
            size: ButtonSize.small,
            onPressed: () {
              Navigator.push(
                context,
                RekaRoute<dynamic>(
                  builder: (BuildContext context) => const PpobRegisterPin(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
