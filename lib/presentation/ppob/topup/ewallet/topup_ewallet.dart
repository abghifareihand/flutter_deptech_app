import 'package:flutter/material.dart';
import 'package:rekalaba/screens/ppob/models/ewallet_model.dart';
import 'package:rekalaba/screens/ppob/widgets/topup_payment_card.dart';
import 'package:rekalaba/ui/shared/form_input.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/button_helpers.dart';
import '../../../../ui/shared/text_helper.dart';
import '../../../../ui/shared/ui_helpers.dart';

class TopupEwallet extends StatefulWidget {
  const TopupEwallet({
    Key? key,
    required this.ewallet,
  }) : super(key: key);
  final EwalletModel ewallet;

  @override
  State<TopupEwallet> createState() => _TopupEwalletState();
}

class _TopupEwalletState extends State<TopupEwallet> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ValueNotifier<bool> _isButtonDisable = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'E-Wallet',
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavbar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TopupPaymentCard(
            paymentName: widget.ewallet.ewalletName,
          ),
          _topupAmount(),
          UIHelper.vertSpace(16),
          _numberPhone(),
        ],
      ),
    );
  }

  Padding _topupAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FormInput(
        controller: _amountController
          ..addListener(() {
            _isButtonDisable.value = _amountController.text.isEmpty;
            _isButtonDisable.value = _phoneController.text.isEmpty;
          }),
        keyboardType: TextInputType.number,
        label: 'Jumlah Top-Up',
        labelStyle: RekaTextStylesV2.textBase.medium.copyWith(
          fontSize: 14,
          color: RekaColorsV2.darkNight,
        ),
        hintStyle: RekaTextStylesV2.textBase.medium.copyWith(
          fontSize: 14,
          color: RekaColorsV2.disabledText,
        ),
        contentStyle: RekaTextStylesV2.textBase.medium.copyWith(
          color: RekaColorsV2.darkNight,
        ),
        autovalidate: true,
        placeholder: 'Masukkan Nominal',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
      ),
    );
  }

  Padding _numberPhone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FormInput(
        controller: _phoneController
          ..addListener(() {
            _isButtonDisable.value = _amountController.text.isEmpty;
            _isButtonDisable.value = _phoneController.text.isEmpty;
          }),
        keyboardType: TextInputType.number,
        label: 'No HP OVO',
        labelStyle: RekaTextStylesV2.textBase.medium.copyWith(
          fontSize: 14,
          color: RekaColorsV2.darkNight,
        ),
        hintStyle: RekaTextStylesV2.textBase.medium.copyWith(
          fontSize: 14,
          color: RekaColorsV2.disabledText,
        ),
        contentStyle: RekaTextStylesV2.textBase.medium.copyWith(
          color: RekaColorsV2.darkNight,
        ),
        autovalidate: true,
        placeholder: 'Masukkan Nominal',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
      ),
    );
  }

  Widget _buildBottomNavbar(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        child: ValueListenableBuilder<bool>(
          valueListenable: _isButtonDisable,
          builder: (BuildContext context, bool isDisabled, Widget? child) {
            return RekaPrimaryButton(
              text: 'Lanjutkan',
              size: ButtonSize.small,
              onPressed: isDisabled
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('[${widget.ewallet.ewalletCode}] [${widget.ewallet.payMethod}] ${_amountController.text}'),
                        ),
                      );
                    },
            );
          },
        ),
      ),
    );
  }
}
