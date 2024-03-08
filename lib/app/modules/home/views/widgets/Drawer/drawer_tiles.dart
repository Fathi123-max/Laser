import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/controllers/home_controller.dart';

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
        // CustomListTile(
        //   onTap: () {},
        //   iconPath: "chat.png",
        //   text: "Chat with us",
        // ),
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
