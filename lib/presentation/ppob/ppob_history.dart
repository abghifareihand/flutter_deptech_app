import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../ui/shared/appbar_helper.dart';
import '../../ui/shared/text_helper.dart';
import '../../ui/shared/ui_helpers.dart';

class PpobHistory extends StatefulWidget {
  const PpobHistory({Key? key}) : super(key: key);

  @override
  State<PpobHistory> createState() => _PpobHistoryState();
}

class _PpobHistoryState extends State<PpobHistory> {
  List<String> items = <String>[
    'Semua',
    'Produk Digital',
    'Mutasi Saldo',
  ];

  int current = 0;

  // Sample dummy data for each tab, now includes payment status
  List<List<Map<String, dynamic>>> transactions = <List<Map<String, dynamic>>>[
    // Semua
    <Map<String, dynamic>>[
      <String, dynamic>{
        'title': 'Top Up Saldo 100.000',
        'price': 'Rp 100.000',
        'subtitle': '082123123123',
        'date': '20 Maret 2024',
        'isPaid': false,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
      <String, dynamic>{
        'title': 'Pembayaran Listrik',
        'price': 'Rp 50.000',
        'subtitle': '082123123124',
        'date': '21 Maret 2024',
        'isPaid': true,
      },
    ],
    // Produk Digital
    <Map<String, dynamic>>[
      <String, dynamic>{
        'title': 'Pembelian Data 10GB',
        'price': 'Rp 20.000',
        'subtitle': '082123123125',
        'date': '22 Maret 2024',
        'isPaid': true,
      },
    ],

    // Mutasi
    <Map<String, dynamic>>[
      <String, dynamic>{
        'title': 'Transfer 50.000',
        'price': 'Rp 50.000',
        'subtitle': '082123123126',
        'date': '23 Maret 2024',
        'isPaid': true,
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RekaColorsV2.white,
      appBar: const AppBarHelper(
        height: 70,
        title: 'Riwayat Transaksi',
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            height: 58.0,
            child: ListView.separated(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 8),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 26,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: current == index ? RekaColorsV2.bluePrimary : RekaColorsV2.white,
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(
                          color: RekaColorsV2.bluePrimary,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          style: RekaTextStylesV2.textXs.medium.copyWith(
                            color: current == index ? RekaColorsV2.white : RekaColorsV2.darkNight,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions[current].length, // Use the current index to determine the item count
            separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> transaction = transactions[current][index]; // Get the relevant transaction
              return _buildTransactionItem(
                title: transaction['title']!,
                price: transaction['price']!,
                subtitle: transaction['subtitle']!,
                date: transaction['date']!,
                isPaid: transaction['isPaid']!,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String price,
    required String subtitle,
    required String date,
    required bool isPaid,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: RekaColorsV2.border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Icon
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFE5ECF5),
              borderRadius: BorderRadius.circular(34),
            ),
            child: const Center(
              child: Icon(
                Icons.phone,
                color: Color(0xFF1B2E48),
                size: 20,
              ),
            ),
          ),
          UIHelper.horzSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: RekaTextStylesV2.textXs.semiBold.copyWith(
                        color: RekaColorsV2.darkNight,
                      ),
                    ),
                    Text(
                      price,
                      style: RekaTextStylesV2.textSm.semiBold.copyWith(
                        color: isPaid ? RekaColorsV2.darkNight : RekaColorsV2.redWarning,
                      ),
                    ),
                  ],
                ),
                UIHelper.vertSpace(8),
                Row(
                  children: <Widget>[
                    Text(
                      subtitle,
                      style: RekaTextStylesV2.textXs.medium.copyWith(
                        color: RekaColorsV2.disabledText,
                      ),
                    ),
                    const Spacer(),
                    if (!isPaid)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: RekaColorsV2.redWarning,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.warning,
                              size: 12,
                              color: RekaColorsV2.white,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              'Menunggu Pembayaran',
                              style: RekaTextStylesV2.text3Xs.semiBold.copyWith(
                                color: RekaColorsV2.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                UIHelper.vertSpace(8),
                Text(
                  date,
                  style: RekaTextStylesV2.textXs.medium.copyWith(
                    color: RekaColorsV2.disabledText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
