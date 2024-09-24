import 'package:flutter/material.dart';
import 'package:rekalaba/core/constants/app_colors.dart';
import 'package:rekalaba/ui/shared/ui_helpers.dart';

import '../../../ui/shared/text_helper.dart';
import '../../../util/custom_icons.dart';

class TopupPaymentCard extends StatelessWidget {
  const TopupPaymentCard({
    Key? key,
    required this.paymentName,
  }) : super(key: key);
  final String paymentName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Top-Up Melalui',
            style: RekaTextStylesV2.textSm.medium.copyWith(
              color: RekaColorsV2.darkNight,
            ),
          ),
          UIHelper.vertSpace(16),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: RekaColorsV2.border,
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: RekaColorsV2.gray,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                UIHelper.horzSpace(10),
                Expanded(
                  flex: 8,
                  child: Text(
                    paymentName,
                    style: RekaTextStylesV2.textSm.medium.copyWith(
                      color: RekaColorsV2.darkNight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                UIHelper.horzSpace(10),
                const Spacer(),
                const Icon(CustomIcons.chevron_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
