import 'package:flutter/material.dart';
import 'package:rekalaba/screens/ppob/models/convenience_store_model.dart';
import 'package:rekalaba/screens/ppob/topup/convenience_store/topup_confirmation_convenience_store.dart';
import 'package:rekalaba/screens/ppob/widgets/topup_payment_card.dart';
import 'package:rekalaba/ui/shared/form_input.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/button_helpers.dart';
import '../../../../ui/shared/text_helper.dart';
import '../../../../ui/shared/ui_helpers.dart';

class TopupConvenienceStore extends StatefulWidget {
  const TopupConvenienceStore({
    Key? key,
    required this.convenienceStore,
  }) : super(key: key);
  final ConvenienceStoreModel convenienceStore;

  @override
  State<TopupConvenienceStore> createState() => _TopupConvenienceStoreState();
}

class _TopupConvenienceStoreState extends State<TopupConvenienceStore> {
  final TextEditingController _amountController = TextEditingController();
  final ValueNotifier<bool> _isButtonDisable = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Convenience Store',
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
            paymentName: widget.convenienceStore.csName,
          ),
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
                      Navigator.push(
                        context,
                        RekaRoute<dynamic>(
                          builder: (BuildContext context) => TopupConfirmationConvenienceStore(
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
