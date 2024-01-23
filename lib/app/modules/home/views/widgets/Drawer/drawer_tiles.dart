import 'package:flutter/material.dart';

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
          onTap: () {},
          iconPath: "language.png",
          text: "العربية",
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
          onTap: () {},
          iconPath: "sign-out.png",
          text: "Sign Out",
        ),
      ],
    );
  }
}
