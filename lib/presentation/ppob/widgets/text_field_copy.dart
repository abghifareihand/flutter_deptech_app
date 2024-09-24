import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/constants/app_colors.dart';
import '../../../ui/shared/text_helper.dart';
import '../../../ui/shared/ui_helpers.dart';

class TextFieldCopy extends StatelessWidget {
  const TextFieldCopy({
    Key? key,
    required this.controller,
    required this.label,
    this.uniqCode = false, // Parameter opsional dengan nilai default
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool uniqCode; // Menambahkan properti uniqCode

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: RekaTextStylesV2.textSm.semiBold.copyWith(
            color: RekaColorsV2.darkNight,
          ),
        ),
        UIHelper.vertSpace(8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: RekaColorsV2.bgPlaceHolder),
            borderRadius: BorderRadius.circular(8.0),
            color: RekaColorsV2.bgPlaceHolder,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: _buildText(controller.text),
                ),
                InkWell(
                  child: const Icon(
                    Icons.copy,
                    color: RekaColorsV2.darkNight,
                    size: 16,
                  ),
                  onTap: () async {
                    final String totalAmount = controller.text.replaceAll('Rp ', '').replaceAll('.', '');
                    await Clipboard.setData(
                      ClipboardData(text: totalAmount),
                    );
                    Fluttertoast.showToast(
                      msg: 'Teks berhasil disalin',
                      toastLength: Toast.LENGTH_LONG,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText(String text) {
    final int textLength = text.length;
    if (uniqCode && textLength > 3) {
      final String lastThreeDigits = text.substring(textLength - 3);
      final String remainingText = text.substring(0, textLength - 3);
      return Row(
        children: <Widget>[
          Text(
            remainingText,
            style: RekaTextStylesV2.textLg.semiBold.copyWith(
              color: RekaColorsV2.darkNight,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE2A32A),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              lastThreeDigits,
              style: RekaTextStylesV2.textLg.semiBold.copyWith(
                color: RekaColorsV2.darkNight,
              ),
            ),
          ),
        ],
      );
    }
    return Text(
      text,
      style: RekaTextStylesV2.textLg.semiBold.copyWith(
        color: RekaColorsV2.darkNight,
      ),
    );
  }
}
