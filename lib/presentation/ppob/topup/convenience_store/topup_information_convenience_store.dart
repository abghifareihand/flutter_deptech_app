import 'package:flutter/material.dart';
import 'package:rekalaba/screens/ppob/widgets/expandable_tile.dart';
import 'package:rekalaba/screens/ppob/widgets/text_field_copy.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/text_helper.dart';
import '../../../../ui/shared/ui_helpers.dart';
import '../../../../util/formatter_service.dart';

class TopupInformationConvenienceStore extends StatelessWidget {
  const TopupInformationConvenienceStore({
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
                // Name cs
                Row(
                  children: <Widget>[
                    // Image cs
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
                          'Alfamart',
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
                  label: 'Kode Transaksi',
                  controller: TextEditingController(text: '13300086002'),
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
                ),
              ],
            ),
          ),
        ),

        // Cara bayar
        UIHelper.vertSpace(16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ExpandableTile(
                title: 'Cara Bayar',
                content: <String>[
                  'Datangi toko Alfamart terdekat.',
                  'Sampaikan kode transaksi kepada kasir.',
                  'Transaksi selesai.',
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
