import 'package:flutter/material.dart';
import 'package:rekalaba/ui/shared/ui_helpers.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/button_helpers.dart';
import '../../../../ui/shared/text_helper.dart';
import '../../widgets/reciept_transaction.dart';

class PaketSmsReceipt extends StatelessWidget {
  const PaketSmsReceipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.bgPlaceHolder,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Struk',
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavbar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 28,
      ),
      child: ClipShadowPath(
        clipper: ReceiptClipper(),
        shadow: Shadow(
          blurRadius: 8,
          color: RekaColorsV2.black.withOpacity(0.08),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: RekaColorsV2.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Logo rekalaba
                      Container(
                        width: 139,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: RekaColorsV2.yellow300,
                        ),
                      ),
                      UIHelper.vertSpace(8),

                      // Date
                      Text(
                        '10/12/2023 15.30',
                        style: RekaTextStylesV2.textSm.medium.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ],
                  ),

                  // Barcode
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: RekaColorsV2.darkNight,
                    ),
                  ),
                ],
              ),
              UIHelper.vertSpace(16),
              const RekaDottedLine(totalDots: 20),
              UIHelper.vertSpace(24),

              Text(
                'Struk Pembelian Paket SMS',
                style: RekaTextStylesV2.textBase.semiBold.copyWith(
                  color: RekaColorsV2.darkNight,
                ),
              ),
              UIHelper.vertSpace(24),
              // Detail Struk
              _detailReciept('No ID', '5417877235'),
              _detailReciept('No Tujuan', '081234567898'),
              _detailReciept('Layanan', 'Paket Data'),
              _detailReciept('Produk', 'TELKOMSEL 15GB'),
              _detailReciept('Deskripsi', 'Telkomsel Paket SMS 75 SMS All Opr 1 Hari'),
              _detailReciept('Status', 'Berhasil'),
              _detailReciept('SN', '61322132154646545'),
              _detailReciept('Harga', 'Rp 65.000'),

              const Spacer(),

              // Thanks
              Text(
                'Terima Kasih\nAtas Kepercayaan Anda',
                style: RekaTextStylesV2.textSm.medium.copyWith(
                  color: RekaColorsV2.darkNight,
                ),
                textAlign: TextAlign.center,
              ),
              UIHelper.vertSpace(24),

              // Copyright
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: RekaColorsV2.yellow300,
                    ),
                  ),
                  UIHelper.horzSpace(6),
                  Text(
                    'Powered by Rekalaba Business Application',
                    style: RekaTextStylesV2.text3Xs.medium.copyWith(
                      color: RekaColorsV2.disabledText,
                    ),
                  ),
                ],
              ),
              UIHelper.vertSpace(24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailReciept(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: RekaTextStylesV2.textSm.regular.copyWith(
                color: RekaColorsV2.darkNight,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(':'),
          ),
          Expanded(
            child: Text(
              subtitle,
              style: RekaTextStylesV2.textSm.regular.copyWith(
                color: RekaColorsV2.darkNight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavbar(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        child: RekaPrimaryButton(
          text: 'Cetak Struk',
          size: ButtonSize.small,
          onPressed: () {},
        ),
      ),
    );
  }
}
