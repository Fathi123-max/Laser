import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';
import 'package:laser/app/modules/wallet/controller/walletController.dart';
import 'package:laser/app/routes/app_pages.dart';

import '../../../../../config/translations/localization_service.dart';
import 'custom_list_tile.dart';

class DrawerTiles extends GetWidget<HomeController> {
  const DrawerTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        // CustomListTile(
        //   onTap: () {},
        // ),
        // CustomListTile(
        //   onTap: () {},
        //   iconPath: "customer.png",
        //   text: "Profile",
        // ),
        // CustomListTile(
        //   onTap: () {},
        //   iconPath: "guarantee.png",
        //   text: "Guarantees",
        // ),
        CustomListTile(
          onTap: () {
            controller.changLang();
          },
          iconPath: "language.png",
          text: !LocalizationService.isItEnglish() ? "English" : "العربية",
        ),
        CustomListTile(
          onTap: () {
            Get.put(WalletController())
                .getBalance(
                    lang: LocalizationService.isItEnglish() ? "en" : "ar")
                .then((value) => Get.toNamed(Routes.Wallet_Detils));
          },
          iconPath: "chat.png",
          text: "Wallet",
        ),
        // CustomListTile(
        //   onTap: () {},
        //   iconPath: "terms-and-conditions.png",
        //   text: "Terms & Conditions",
        // ),
        // CustomListTile(
        //   onTap: () {},
        //   iconPath: "settings.png",
        //   text: "Account Settings",
        // ),
        CustomListTile(
          onTap: () {
            controller.signout();
          },
          iconPath: "sign-out.png",
          text: "Sign Out",
        ),
      ],
    );
  }
}
