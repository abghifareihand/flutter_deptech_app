import 'package:flutter/material.dart';
import 'package:rekalaba/screens/ppob/models/ewallet_model.dart';
import 'package:rekalaba/screens/ppob/topup/ewallet/topup_ewallet.dart';
import 'package:rekalaba/ui/shared/text_helper.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/ui_helpers.dart';
import '../../../../util/custom_icons.dart';

class ListEwallet extends StatelessWidget {
  const ListEwallet({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: RekaTextStylesV2.textBase.semiBold.copyWith(
              color: RekaColorsV2.darkNight,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ewalletList.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 1,
              color: RekaColorsV2.border,
            ),
            itemBuilder: (BuildContext context, int index) {
              final EwalletModel ewallet = ewalletList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    RekaRoute<dynamic>(
                      builder: (BuildContext context) => TopupEwallet(ewallet: ewallet),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                      UIHelper.horzSpace(8),
                      Text(
                        ewalletList[index].ewalletName,
                        style: RekaTextStylesV2.textBase.regular.copyWith(
                          fontSize: 14,
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                      UIHelper.horzSpace(8),
                      const Spacer(),
                      const Icon(
                        CustomIcons.chevron_right,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          UIHelper.vertSpace(8),
        ],
      ),
    );
  }
}
