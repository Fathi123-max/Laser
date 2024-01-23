import 'package:flutter/material.dart';

import 'Drawer/drawer_tiles.dart';
import 'Drawer/drawer_top.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Color(0xFF1B1926),
      child: Column(
        children: [DrawerTop(), DrawerTiles()],
      ),
    );
  }
}
