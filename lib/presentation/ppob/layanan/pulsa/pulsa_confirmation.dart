import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rekalaba/core/constants/app_colors.dart';
import 'package:rekalaba/screens/ppob/layanan/pulsa/pulsa_receipt.dart';
import 'package:rekalaba/ui/shared/text_helper.dart';
import 'package:rekalaba/util/formatter_service.dart';

import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/button_helpers.dart';
import '../../../../ui/shared/ui_helpers.dart';

class PulsaConfirmation extends StatelessWidget {
  const PulsaConfirmation({Key? key}) : super(key: key);

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
                    'Pulsa',
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
                    'TELKOMSEL 2000',
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
                    'Telkomsel Reguler Rp 2.000',
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
                    'Rp ${FormatterService.getPriceFormatInt(2800)}',
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
                    'Rp ${FormatterService.getPriceFormatInt(2800)}',
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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Container(
                                  height: 5,
                                  width: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: RekaColorsV2.border,
                                  ),
                                ),
                              ),
                              UIHelper.vertSpace(24),
                              Text(
                                'Masukkan PIN',
                                style: RekaTextStylesV2.textLg.semiBold.copyWith(
                                  color: RekaColorsV2.darkNight,
                                ),
                              ),
                              UIHelper.vertSpace(12),
                              Text(
                                'Masukkan 6 Digit PIN transaksi anda',
                                style: RekaTextStylesV2.textXs.regular.copyWith(
                                  color: RekaColorsV2.disabledText,
                                ),
                              ),
                              UIHelper.vertSpace(24),

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
                                  errorPinTheme: PinTheme(
                                    width: 42,
                                    height: 69,
                                    textStyle: RekaTextStylesV2.text2Xl.bold.copyWith(
                                      color: RekaColorsV2.darkNight,
                                    ),
                                    decoration: BoxDecoration(
                                      color: RekaColorsV2.bgPlaceHolder,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: RekaColorsV2.redWarning,
                                      ),
                                    ),
                                  ),
                                  errorTextStyle: RekaTextStylesV2.textXs.regular.copyWith(
                                    color: RekaColorsV2.redWarning,
                                  ),
                                  validator: (String? value) {
                                    return value == '123456' ? null : 'PIN yang anda masukkan salah';
                                  },
                                ),
                              ),
                              const Spacer(),

                              RekaPrimaryButton(
                                text: 'Lanjutkan',
                                size: ButtonSize.small,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    RekaRoute<dynamic>(
                                      builder: (BuildContext context) => const PulsaReceipt(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
