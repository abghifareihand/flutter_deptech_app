import 'package:flutter/material.dart';
import 'package:rekalaba/screens/ppob/widgets/expandable_tile.dart';
import 'package:rekalaba/screens/ppob/widgets/text_field_copy.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/text_helper.dart';
import '../../../../ui/shared/ui_helpers.dart';
import '../../../../util/formatter_service.dart';

class TopupInformationTransferBank extends StatelessWidget {
  const TopupInformationTransferBank({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Transfer Sekarang',
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Header
        Container(
          height: 40,
          color: RekaColorsV2.bluePrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Transfer Sebelum ',
                      style: RekaTextStylesV2.textXs.semiBold.copyWith(
                        color: RekaColorsV2.white,
                      ),
                    ),
                    TextSpan(
                      text: '8 Apr 2024, 15:00 WIB.',
                      style: RekaTextStylesV2.textXs.medium.copyWith(
                        color: RekaColorsV2.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: RekaColorsV2.baseGold,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '59 : 24',
                  style: RekaTextStylesV2.text2Xs.semiBold.copyWith(
                    color: RekaColorsV2.bluePrimary,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Card
        UIHelper.vertSpace(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: RekaColorsV2.border,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Name Bank
                Row(
                  children: <Widget>[
                    // Image bank
                    Container(
                      height: 26,
                      width: 48,
                      color: RekaColorsV2.gray,
                    ),
                    UIHelper.horzSpace(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bank Mandiri',
                          style: RekaTextStylesV2.textSm.regular.copyWith(
                            color: RekaColorsV2.darkNight,
                          ),
                        ),
                        Text(
                          'PT Fokus Inovasi Faradisa Abadi',
                          style: RekaTextStylesV2.textSm.semiBold.copyWith(
                            color: RekaColorsV2.darkNight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Rekening
                UIHelper.vertSpace(16),
                TextFieldCopy(
                  label: 'Nomor Rekening',
                  controller: TextEditingController(text: '251451323548452'),
                ),
                UIHelper.vertSpace(16),
                const Divider(
                  height: 1,
                  color: RekaColorsV2.border,
                ),
                UIHelper.vertSpace(16),
                TextFieldCopy(
                  label: 'Jumlah Transfer',
                  controller: TextEditingController(
                    text: 'Rp ${FormatterService.getPriceFormatInt(totalPrice)}',
                  ),
                  uniqCode: true,
                ),
                UIHelper.vertSpace(8),
                Text(
                  'Pastikan jumlahnya sesuai hingga 3 digit terakhir',
                  style: RekaTextStylesV2.text2Xs.medium.copyWith(
                    color: const Color(0xFFE2A32A),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Cara bayar
        UIHelper.vertSpace(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Cara Bayar',
                style: RekaTextStylesV2.textSm.semiBold.copyWith(
                  color: RekaColorsV2.darkNight,
                ),
              ),
              UIHelper.vertSpace(16),
              const ExpandableTile(
                title: 'ATM Mandiri',
                content: <String>[
                  'Masukkan kartu [ATM Mandiri] ke mesin.',
                  'Masukkan [6 digit PIN] ATM Mandiri.',
                  'Pilih [Bahasa] dan Pilih ["Transaksi Lainnya"].',
                  'Masukkan nomor rekening tujuan dan nominal transfer.',
                  'Konfirmasi transaksi dan tunggu struk.',
                ],
              ),
              UIHelper.vertSpace(16),
              const ExpandableTile(
                title: 'Internet Banking',
                content: <String>[
                  'Belum ada [tutornya]',
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
