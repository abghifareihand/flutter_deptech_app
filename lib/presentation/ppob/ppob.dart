import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rekalaba/screens/ppob/ppob_register_information.dart';
import 'package:rekalaba/ui/shared/button_helpers.dart';
import 'package:rekalaba/util/sync_service.dart';

import '../../core/constants/app_colors.dart';
import '../../repositories/notif/notif_page_repository.dart';
import '../../ui/shared/appbar_helper.dart';
import '../../ui/shared/text_helper.dart';
import '../../ui/shared/ui_helpers.dart';
import '../drawer.dart';

class Ppob extends StatelessWidget {
  const Ppob({Key? key}) : super(key: key);

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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Fitur PPOB belum aktif',
            style: RekaTextStylesV2.textLg.medium.copyWith(
              color: RekaColorsV2.darkNight,
            ),
          ),
          UIHelper.vertSpace(22),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 100,
            ),
            child: RekaPrimaryButton(
              text: 'Aktivasi Sekarang',
              size: ButtonSize.small,
              onPressed: () {
                Navigator.push(
                  context,
                  RekaRoute<dynamic>(
                    builder: (BuildContext context) => const PpobRegisterInformation(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
