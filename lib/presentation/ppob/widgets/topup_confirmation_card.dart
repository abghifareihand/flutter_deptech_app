import 'package:flutter/material.dart';
import 'package:rekalaba/ui/shared/text_helper.dart';
import 'package:rekalaba/ui/shared/ui_helpers.dart';
import 'package:rekalaba/util/formatter_service.dart';

import '../../../core/constants/app_colors.dart';

class TopupConfirmationCard extends StatelessWidget {
  const TopupConfirmationCard({
    Key? key,
    required this.payMethod,
    required this.amount,
    required this.fee,
    required this.total,
  }) : super(key: key);

  final String payMethod;
  final int amount;
  final int fee;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: RekaColorsV2.border,
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Detail Transaksi',
              style: RekaTextStylesV2.textLg.semiBold.copyWith(
                color: RekaColorsV2.darkNight,
              ),
            ),
            UIHelper.vertSpace(16),
            const Divider(
              color: RekaColorsV2.border,
              height: 1,
            ),
            UIHelper.vertSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Metode Pembayaran',
                  style: RekaTextStylesV2.textBase.regular.copyWith(
                    fontSize: 14,
                    color: RekaColorsV2.disabledText,
                  ),
                ),
                Expanded(
                  child: Text(
                    payMethod,
                    style: RekaTextStylesV2.textBase.semiBold.copyWith(
                      fontSize: 14,
                      color: RekaColorsV2.darkNight,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            UIHelper.vertSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nominal',
                  style: RekaTextStylesV2.textSm.regular.copyWith(
                    color: RekaColorsV2.disabledText,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Rp ${FormatterService.getPriceFormatInt(amount)}',
                    style: RekaTextStylesV2.textSm.regular.copyWith(
                      color: RekaColorsV2.darkNight,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            UIHelper.vertSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Biaya',
                  style: RekaTextStylesV2.textSm.regular.copyWith(
                    color: RekaColorsV2.disabledText,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Rp ${FormatterService.getPriceFormatInt(fee)}',
                    style: RekaTextStylesV2.textSm.regular.copyWith(
                      color: RekaColorsV2.darkNight,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            UIHelper.vertSpace(16),
            const RekaDottedLine(totalDots: 10),
            UIHelper.vertSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Total',
                  style: RekaTextStylesV2.textBase.semiBold.copyWith(
                    fontSize: 16,
                    color: RekaColorsV2.darkNight,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Rp ${FormatterService.getPriceFormatInt(total)}',
                    style: RekaTextStylesV2.textBase.semiBold.copyWith(
                      fontSize: 16,
                      color: RekaColorsV2.darkNight,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
