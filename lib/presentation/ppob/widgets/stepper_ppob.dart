import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../ui/shared/text_helper.dart';

class StepperPpob extends StatelessWidget {
  const StepperPpob({
    Key? key,
    required this.title,
    required this.step,
  }) : super(key: key);

  final String title;
  final String step;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              // Leading
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B2E48),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    step,
                    style: RekaTextStylesV2.textXs.semiBold.copyWith(
                      color: RekaColorsV2.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),

              // Title
              Text(
                title,
                style: RekaTextStylesV2.textSm.medium.copyWith(
                  color: RekaColorsV2.bluePrimary,
                ),
              ),

              const Spacer(),

              // Trailing
              Text(
                '$step/3',
                style: RekaTextStylesV2.textXs.semiBold.copyWith(
                  color: RekaColorsV2.bluePrimary,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: RekaColorsV2.backgroundMudGrey,
          thickness: 1,
          height: 8,
        ),
      ],
    );
  }
}
