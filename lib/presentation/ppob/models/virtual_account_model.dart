class VirtualAccountModel {
  VirtualAccountModel({
    required this.bankName,
    required this.bankCode,
    required this.payMethod,
  });

  final String bankName;
  final String bankCode;
  final String payMethod;
}

// Daftar Virtual Account dummy
List<VirtualAccountModel> virtualAccountList = <VirtualAccountModel>[
  VirtualAccountModel(
    bankName: 'Bank Mandiri',
    bankCode: 'VA_BMRI',
    payMethod: '02',
  ),
  VirtualAccountModel(
    bankName: 'Bank Internatioal Indonesia Maybank',
    bankCode: 'VA_IBBK',
    payMethod: '02',
  ),
  VirtualAccountModel(
    bankName: 'Bank Permata',
    bankCode: 'VA_BBBAI',
    payMethod: '02',
  ),
  VirtualAccountModel(
    bankName: 'Bank Central Asia (BCA)',
    bankCode: 'VA_CENA',
    payMethod: '02',
  ),
  VirtualAccountModel(
    bankName: 'Bank Negara Indonesia 46 (BNI)',
    bankCode: 'VA_BNIN',
    payMethod: '02',
  ),
  VirtualAccountModel(
    bankName: 'Bank KEB Hana Indonesia',
    bankCode: 'VA_HNBN',
    payMethod: '02',
  ),
  VirtualAccountModel(
    bankName: 'Bank Rakyat Indonesia (BRI)',
    bankCode: 'VA_BRIN',
    payMethod: '02',
  ),
  VirtualAccountModel(
    bankName: 'Bank CIMB Niaga',
    bankCode: 'VA_BNIA',
    payMethod: '02',
  ),
  VirtualAccountModel(
    bankName: 'Bank Danamon',
    bankCode: 'VA_BDIN',
    payMethod: '02',
  ),
];
