class ConvenienceStoreModel {
  ConvenienceStoreModel({
    required this.csName,
    required this.csCode,
    required this.payMethod,
  });

  final String csName;
  final String csCode;
  final String payMethod;
}

// Daftar Convenience Store dummy
List<ConvenienceStoreModel> convenienceStoreList = <ConvenienceStoreModel>[
  ConvenienceStoreModel(
    csName: 'Alfamart',
    csCode: 'CVS_ALMA',
    payMethod: '03',
  ),
  ConvenienceStoreModel(
    csName: 'Indomaret',
    csCode: 'CVS_INDO',
    payMethod: '03',
  ),
];
