import 'package:flutter/material.dart';
import 'package:rekalaba/screens/ppob/layanan/pulsa/pulsa_confirmation.dart';
import 'package:rekalaba/ui/shared/ui_helpers.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../ui/shared/appbar_helper.dart';
import '../../../../ui/shared/form_input.dart';
import '../../../../ui/shared/text_helper.dart';

class PulsaSelectNominal extends StatefulWidget {
  const PulsaSelectNominal({
    Key? key,
    required this.number,
  }) : super(key: key);
  final String number;

  @override
  State<PulsaSelectNominal> createState() => _PulsaSelectNominalState();
}

class _PulsaSelectNominalState extends State<PulsaSelectNominal> {
  final TextEditingController _numberController = TextEditingController();

  // Data dummy untuk nominal pulsa
  final List<Map<String, dynamic>> _listPulsa = <Map<String, dynamic>>[
    <String, dynamic>{
      'provider': 'TELKOMSEL',
      'nominal': 2000,
      'price': 2800,
      'isSold': false,
    },
    <String, dynamic>{
      'provider': 'TELKOMSEL',
      'nominal': 3000,
      'price': 3800,
      'isSold': false,
    },
    <String, dynamic>{
      'provider': 'TELKOMSEL',
      'nominal': 5000,
      'price': 5800,
      'isSold': false,
    },
    <String, dynamic>{
      'provider': 'TELKOMSEL',
      'nominal': 5000,
      'price': 2800,
      'isSold': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    _numberController.text = widget.number;
  }

  String getProvider(String number) {
    if (number.startsWith('087')) {
      return 'XL';
    } else if (number.startsWith('089')) {
      return 'TRI';
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Pulsa',
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        _inputNumber(),
        _selectNominal(),
      ],
    );
  }

  Widget _inputNumber() {
    final String provider = getProvider(_numberController.text);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: FormInput(
        readOnly: true,
        controller: _numberController,
        keyboardType: TextInputType.number,
        label: 'Masukkan Nomor HP',
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
        placeholder: 'cth: 082123123123',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        suffixText: provider,
      ),
    );
  }

  Widget _selectNominal() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Pilih Nominal',
            style: RekaTextStylesV2.textBase.semiBold.copyWith(
              color: RekaColorsV2.darkNight,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _listPulsa.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            separatorBuilder: (BuildContext context, int index) => UIHelper.vertSpace(8),
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> data = _listPulsa[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    RekaRoute<dynamic>(
                      builder: (BuildContext context) => const PulsaConfirmation(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: data['isSold'] ? RekaColorsV2.bgPlaceHolder : RekaColorsV2.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: RekaColorsV2.border,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${data['provider']} ${data['nominal']}',
                            style: RekaTextStylesV2.textXs.semiBold.copyWith(
                              color: data['isSold'] ? RekaColorsV2.disabledText : RekaColorsV2.darkNight,
                            ),
                          ),
                          if (data['isSold'])
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: RekaColorsV2.redWarning,
                              ),
                              child: Text(
                                'Kosong',
                                style: RekaTextStylesV2.textXs.medium.copyWith(
                                  color: RekaColorsV2.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                      UIHelper.vertSpace(8),
                      Text(
                        '${data['provider']} Reguler ${data['nominal']}',
                        style: RekaTextStylesV2.textXs.medium.copyWith(
                          color: RekaColorsV2.disabledText,
                        ),
                      ),
                      UIHelper.vertSpace(8),
                      Text(
                        'Rp ${data['price']}',
                        style: RekaTextStylesV2.textXs.medium.copyWith(
                          color: data['isSold'] ? RekaColorsV2.disabledText : RekaColorsV2.darkNight,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
