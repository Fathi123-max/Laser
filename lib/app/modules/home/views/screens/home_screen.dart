import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/views/pages/device_brand_page.dart';
import 'package:laser/app/modules/home/views/pages/device_type_page.dart';
import 'package:laser/app/modules/home/views/pages/service_page.dart';
import 'package:laser/app/modules/home/views/widgets/home_model.dart';

import '../../controllers/home_controller.dart';
import '../pages/order_ditails_page.dart';
import '../pages/order_page.dart';
import '../pages/visit_details_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeViewModel(
      child: SizedBox(
        height: 410.h,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController.value,
          children: const [
            DeviceTypePage(),
            DeviceBrandPage(),
            ServicePage(),
            VisitDetailsPage(),
            OrderPage(),
            OrderDitailsPage()
          ],
        ),
      ),
    );
  }
}
