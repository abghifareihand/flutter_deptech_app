class BankTransferModel {
  BankTransferModel({
    required this.bankName,
    required this.bankCode,
  });

  final String bankName;
  final String bankCode;
}

// Daftar bank dummy
List<BankTransferModel> bankTransferList = <BankTransferModel>[
  BankTransferModel(
    bankName: 'Bank Mandiri',
    bankCode: 'MANDIRI',
  ),
  BankTransferModel(
    bankName: 'Bank Central Asia (BCA)',
    bankCode: 'BCA',
  ),
  BankTransferModel(
    bankName: 'Bank Negara Indonesia 46 (BNI)',
    bankCode: 'BNI',
  ),
  BankTransferModel(
    bankName: 'Bank Rakyat Indonesia (BRI)',
    bankCode: 'BRI',
  ),
];
