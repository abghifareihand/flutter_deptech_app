import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rekalaba/screens/ppob/ppob_home.dart';
import 'package:rekalaba/screens/ppob/widgets/stepper_ppob.dart';
import 'package:rekalaba/ui/shared/ui_helpers.dart';

import '../../core/constants/app_colors.dart';
import '../../ui/shared/appbar_helper.dart';
import '../../ui/shared/button_helpers.dart';
import '../../ui/shared/text_helper.dart';

class PpobRegisterPin extends StatelessWidget {
  const PpobRegisterPin({Key? key}) : super(key: key);

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
            title: 'Atur PIN',
            step: '3',
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Atur PIN',
                  style: RekaTextStylesV2.textLg.semiBold.copyWith(
                    color: RekaColorsV2.darkNight,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  'Atur 6 digit PIN transaksi anda.',
                  style: RekaTextStylesV2.textSm.regular.copyWith(
                    color: RekaColorsV2.disabledText,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          width: 24,
                          height: 1,
                          color: RekaColorsV2.darkNight,
                        ),
                      ],
                    ),
                    length: 6,
                    separatorBuilder: (_) => const SizedBox(width: 24),
                    defaultPinTheme: PinTheme(
                      width: 42,
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
            text: 'Atur PIN',
            size: ButtonSize.small,
            onPressed: () {
              Navigator.push(
                context,
                RekaRoute<dynamic>(
                  builder: (BuildContext context) => const PpobHome(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
