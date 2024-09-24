import 'package:flutter/material.dart';
import 'package:rekalaba/core/constants/app_colors.dart';
import 'package:rekalaba/screens/ppob/layanan/paket_sms/paket_sms_receipt.dart';
import 'package:rekalaba/ui/shared/text_helper.dart';
import 'package:rekalaba/util/formatter_service.dart';

import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/button_helpers.dart';
import '../../../../ui/shared/ui_helpers.dart';

class PaketSmsConfirmation extends StatelessWidget {
  const PaketSmsConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Konfirmasi Pesanan',
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavbar(context),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        UIHelper.vertSpace(16),
        _detailConfirmation(),
      ],
    );
  }

  Widget _detailConfirmation() {
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
                  'Jenis Layanan',
                  style: RekaTextStylesV2.textBase.regular.copyWith(
                    fontSize: 14,
                    color: RekaColorsV2.disabledText,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Paket SMS',
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
                  'Nomor Tujuan',
                  style: RekaTextStylesV2.textBase.regular.copyWith(
                    fontSize: 14,
                    color: RekaColorsV2.disabledText,
                  ),
                ),
                Expanded(
                  child: Text(
                    '081231231231',
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
                  'Produk',
                  style: RekaTextStylesV2.textSm.regular.copyWith(
                    color: RekaColorsV2.disabledText,
                  ),
                ),
                Expanded(
                  child: Text(
                    'TSMS5',
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
                  'Deskripsi',
                  style: RekaTextStylesV2.textSm.regular.copyWith(
                    color: RekaColorsV2.disabledText,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Telkomsel Paket SMS 75 SMS All Opr 1 Hari',
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
                  'Harga',
                  style: RekaTextStylesV2.textSm.regular.copyWith(
                    color: RekaColorsV2.disabledText,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Rp ${FormatterService.getPriceFormatInt(25000)}',
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
                    color: RekaColorsV2.darkNight,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Rp ${FormatterService.getPriceFormatInt(25000)}',
                    style: RekaTextStylesV2.textBase.semiBold.copyWith(
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

  Widget _buildBottomNavbar(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: SizedBox(
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Saldo',
                    style: RekaTextStylesV2.textSm.regular.copyWith(
                      color: RekaColorsV2.darkNight,
                    ),
                  ),
                  Text(
                    'Rp ${FormatterService.getPriceFormatInt(100000)}',
                    style: RekaTextStylesV2.textBase.semiBold.copyWith(
                      color: RekaColorsV2.darkNight,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: RekaPrimaryButton(
                text: 'Pembayaran',
                size: ButtonSize.small,
                onPressed: () {
                  Navigator.push(
                    context,
                    RekaRoute<dynamic>(builder: (BuildContext context) => const PaketSmsReceipt()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
