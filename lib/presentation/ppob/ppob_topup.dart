import 'package:flutter/material.dart';
import 'package:rekalaba/screens/ppob/topup/transfer_bank/list_transfer_bank.dart';
import 'package:rekalaba/screens/ppob/topup/virtual_account/list_virtual_account.dart';

import '../../core/constants/app_colors.dart';
import '../../ui/shared/appbar_helper.dart';
import '../../ui/shared/ui_helpers.dart';
import 'topup/convenience_store/list_convenience_store.dart';
import 'topup/ewallet/list_ewallet.dart';

class PpobTopup extends StatelessWidget {
  const PpobTopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Top-Up Saldo',
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.vertSpace(16),
          const ListTransferBank(title: 'Bank Transfer'),
          const ListVirtualAccount(title: 'Transfer Virtual Account'),
          const ListConvenienceStore(title: 'Convenience Store'),
          const ListEwallet(title: 'Ewallet'),
        ],
      ),
    );
  }
}
