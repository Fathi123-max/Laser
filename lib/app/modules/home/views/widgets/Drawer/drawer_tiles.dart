import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/core/constants.dart';
import 'package:laser/app/data/local/my_shared_pref.dart';
import 'package:laser/app/routes/app_pages.dart';
import 'package:laser/app/services/base_client.dart';

import '../../../../../config/translations/localization_service.dart';
import 'custom_list_tile.dart';

class DrawerTiles extends StatelessWidget {
  const DrawerTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CustomListTile(
          onTap: () {},
        ),
        CustomListTile(
          onTap: () {},
          iconPath: "customer.png",
          text: "Profile",
        ),
        CustomListTile(
          onTap: () {},
          iconPath: "guarantee.png",
          text: "Guarantees",
        ),
        CustomListTile(
          onTap: () {
            LocalizationService.updateLanguage(
                !LocalizationService.isItEnglish() ? "en" : "ar");
          },
          iconPath: "language.png",
          text: !LocalizationService.isItEnglish() ? "English" : "العربية",
        ),
        CustomListTile(
          onTap: () {},
          iconPath: "chat.png",
          text: "Chat with us",
        ),
        CustomListTile(
          onTap: () {},
          iconPath: "terms-and-conditions.png",
          text: "Terms & Conditions",
        ),
        CustomListTile(
          onTap: () {},
          iconPath: "settings.png",
          text: "Account Settings",
        ),
        CustomListTile(
          onTap: () {
            signout();
          },
          iconPath: "sign-out.png",
          text: "Sign Out",
        ),
      ],
    );
  }

  signout() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.logoutUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
      },
      onSuccess: (response) {
        // *) indicate success state
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user

        if (error.statusCode == 401) {
          Get.offAllNamed(Routes.LoginPage);
        }
        MySharedPref.clear();
        // BaseClient.handleApiError(error);
      },
    );
  }
}
