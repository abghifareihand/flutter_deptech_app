import 'package:flutter/material.dart';
import 'package:rekalaba/screens/ppob/models/virtual_account_model.dart';
import 'package:rekalaba/ui/shared/form_input.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/button_helpers.dart';
import '../../../../ui/shared/text_helper.dart';
import '../../../../ui/shared/ui_helpers.dart';
import '../../widgets/topup_payment_card.dart';
import 'topup_confirmation_virtual_account.dart';

class TopupVirtualAccount extends StatefulWidget {
  const TopupVirtualAccount({
    Key? key,
    required this.virtualAccount,
  }) : super(key: key);
  final VirtualAccountModel virtualAccount;

  @override
  State<TopupVirtualAccount> createState() => _TopupVirtualAccountState();
}

class _TopupVirtualAccountState extends State<TopupVirtualAccount> {
  final TextEditingController _amountController = TextEditingController();
  final ValueNotifier<bool> _isButtonDisable = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Transfer Virtual Account',
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
            paymentName: widget.virtualAccount.bankName,
          ),
          UIHelper.vertSpace(16),
          _topupAmount(),
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
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('[${widget.virtualAccount.bankCode}] [${widget.virtualAccount.payMethod}] ${_amountController.text}'),
                      //   ),
                      // );
                      Navigator.push(
                        context,
                        RekaRoute<dynamic>(
                          builder: (BuildContext context) => TopupConfirmationVirtualAccount(
                            amount: int.parse(_amountController.text),
                          ),
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
