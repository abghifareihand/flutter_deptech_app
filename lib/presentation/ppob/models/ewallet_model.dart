class EwalletModel {
  EwalletModel({
    required this.ewalletName,
    required this.ewalletCode,
    required this.payMethod,
  });

  final String ewalletName;
  final String ewalletCode;
  final String payMethod;
}

// Daftar Convenience Store dummy
List<EwalletModel> ewalletList = <EwalletModel>[
  EwalletModel(
    ewalletName: 'OVO',
    ewalletCode: 'EWALLET_OVOE',
    payMethod: '05',
  ),
];
