import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/button_helpers.dart';
import '../../../../ui/shared/ui_helpers.dart';
import '../../widgets/topup_confirmation_card.dart';
import 'topup_information_convenience_store.dart';

class TopupConfirmationConvenienceStore extends StatelessWidget {
  const TopupConfirmationConvenienceStore({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Konfirmasi Top-Up',
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavbar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.vertSpace(16),
          _detailTransaction(),
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
          text: 'Lanjutkan Pembayaran',
          size: ButtonSize.small,
          onPressed: () {
            Navigator.push(
              context,
              RekaRoute<dynamic>(
                builder: (BuildContext context) => TopupInformationConvenienceStore(totalPrice: amount),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _detailTransaction() {
    const int fee = 5000; // dummy fee
    final int total = amount + fee;
    return TopupConfirmationCard(
      payMethod: 'Alfamart',
      amount: amount,
      fee: fee,
      total: total,
    );
  }
}
