import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rekalaba/screens/ppob/layanan/paket_data/paket_data_input_number.dart';
import 'package:rekalaba/screens/ppob/layanan/paket_sms/paket_sms_input_number.dart';
import 'package:rekalaba/screens/ppob/layanan/pulsa/pulsa_input_number.dart';
import 'package:rekalaba/screens/ppob/ppob_history.dart';
import 'package:rekalaba/screens/ppob/ppob_topup.dart';
import 'package:rekalaba/util/sync_service.dart';

import '../../core/constants/app_colors.dart';
import '../../repositories/notif/notif_page_repository.dart';
import '../../ui/shared/appbar_helper.dart';
import '../../ui/shared/text_helper.dart';
import '../../ui/shared/ui_helpers.dart';
import '../drawer.dart';

class PpobHome extends StatelessWidget {
  const PpobHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(
        routeNameTapped: 'Ppob',
        drawerCallBack: (_) {},
        notifPageRepository: Provider.of<NotifPageRepository>(context),
        syncService: Provider.of<SyncService>(context),
      ),
      backgroundColor: RekaColorsV2.white,
      appBar: AppBarHelper(
        height: 70.0.h,
        title: 'PPOB',
        isLeadingMenu: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                RekaRoute<dynamic>(
                  builder: (BuildContext context) => const PpobHistory(),
                ),
              );
            },
            icon: const Icon(
              Icons.history,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Card Saldo
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 24,
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 77,
                  decoration: BoxDecoration(
                    color: RekaColorsV2.bluePrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: -30,
                  child: Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      color: RekaColorsV2.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: -15,
                  child: Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      color: RekaColorsV2.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                ),

                // Content card saldo
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      // Saldo
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Saldo Saat ini',
                            style: RekaTextStylesV2.textXs.regular.copyWith(
                              color: RekaColorsV2.white,
                            ),
                          ),
                          Text(
                            'Rp 100.000',
                            style: RekaTextStylesV2.textLg.semiBold.copyWith(
                              color: RekaColorsV2.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),

                      // Button topup
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            RekaRoute<dynamic>(
                              builder: (BuildContext context) => const PpobTopup(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: RekaColorsV2.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: RekaColorsV2.darkNight,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons.add,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                'Top Up',
                                style: RekaTextStylesV2.textXs.medium.copyWith(
                                  color: RekaColorsV2.darkNight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Menu Pilih Layanan
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pilih Layanan',
                  style: RekaTextStylesV2.textBase.semiBold.copyWith(
                    color: RekaColorsV2.darkNight,
                  ),
                ),
                UIHelper.vertSpace(16),

                // Item layanan
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: <Widget>[
                    _buildServiceItem(
                      label: 'Pulsa',
                      icon: Icons.phone,
                      onTap: () {
                        Navigator.push(
                          context,
                          RekaRoute<dynamic>(
                            builder: (BuildContext context) => const PulsaInputNumber(),
                          ),
                        );
                      },
                      icColor: const Color(0xFF1B2E48),
                      icBg: const Color(0xFFE5ECF5),
                    ),
                    _buildServiceItem(
                      label: 'Pembayaran',
                      icon: Icons.note,
                      onTap: () {},
                      icColor: const Color(0xFF9C4562),
                      icBg: const Color(0xFFF5E5EB),
                    ),
                    _buildServiceItem(
                      label: 'Paket Data',
                      icon: Icons.phone,
                      onTap: () {
                        Navigator.push(
                          context,
                          RekaRoute<dynamic>(
                            builder: (BuildContext context) => const PaketDataInputNumber(),
                          ),
                        );
                      },
                      icColor: const Color(0xFF3B8AA5),
                      icBg: const Color(0xFFE4F2F6),
                    ),
                    _buildServiceItem(
                      label: 'Paket SMS',
                      icon: Icons.sms,
                      onTap: () {
                        Navigator.push(
                          context,
                          RekaRoute<dynamic>(
                            builder: (BuildContext context) => const PaketSmsInputNumber(),
                          ),
                        );
                      },
                      icColor: const Color(0xFFDDA624),
                      icBg: const Color(0xFFFAF2E0),
                    ),
                    _buildServiceItem(
                      label: 'Paket Telfon',
                      icon: Icons.phone,
                      onTap: () {},
                      icColor: const Color(0xFF9B2AAD),
                      icBg: const Color(0xFFF8EAFA),
                    ),
                    _buildServiceItem(
                      label: 'Transfer Bank',
                      icon: Icons.note,
                      onTap: () {},
                      icColor: const Color(0xFF218F85),
                      icBg: const Color(0xFFE2F8F6),
                    ),
                    _buildServiceItem(
                      label: 'Emoney',
                      icon: Icons.phone,
                      onTap: () {},
                      icColor: const Color(0xFFB85A26),
                      icBg: const Color(0xFFFBF0EA),
                    ),
                    _buildServiceItem(
                      label: 'Voucher Game',
                      icon: Icons.note,
                      onTap: () {},
                      icColor: const Color(0xFF4A5386),
                      icBg: const Color(0xFFE8EAF2),
                    ),
                  ],
                ),
              ],
            ),
          ),

          UIHelper.vertSpace(22),
          const Divider(
            thickness: 8,
            color: Color(0xFFF4F4F4),
            height: 16,
          ),
          UIHelper.vertSpace(16),

          // Menu Riwayat Transaksi
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Riwayat Transaksi',
                      style: RekaTextStylesV2.textBase.semiBold.copyWith(
                        color: RekaColorsV2.darkNight,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Lihat Semua',
                        style: RekaTextStylesV2.textXs.regular.copyWith(
                          color: RekaColorsV2.darkNight,
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildTransactionItem(
                      title: 'Pulsa Telkomsel 10rb',
                      price: 'Rp 10.500',
                      subtitle: '082123123123',
                      date: '20 Maret 2024',
                      icon: Icons.phone,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem({
    required String label,
    required IconData icon,
    required Function() onTap,
    required Color icBg,
    required Color icColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: icBg,
              borderRadius: BorderRadius.circular(34),
            ),
            child: Center(
              child: Icon(
                icon,
                color: icColor,
                size: 20,
              ),
            ),
          ),
          UIHelper.vertSpace(4),
          Expanded(
            child: Text(
              label,
              style: RekaTextStylesV2.textSm.regular.copyWith(
                color: RekaColorsV2.darkNight,
              ),
              textAlign: TextAlign.center,
            ),
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
    required IconData icon,
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
            child: Center(
              child: Icon(
                icon,
                color: const Color(0xFF1B2E48),
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
                        color: RekaColorsV2.darkNight,
                      ),
                    ),
                  ],
                ),
                UIHelper.vertSpace(8),
                Text(
                  subtitle,
                  style: RekaTextStylesV2.textXs.medium.copyWith(
                    color: RekaColorsV2.disabledText,
                  ),
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
