import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/home/views/widgets/home/home_base_view_model.dart';
import 'package:laser/app/modules/techome/controller/techomecontroller.dart';
import 'package:laser/app/modules/techome/views/widgets/orderspage.dart';
import 'package:laser/app/modules/techome/views/widgets/orderstypespage.dart';

class TecHomeView extends GetView<TecHomeController> {
  const TecHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: HomeBaseViewModel(
        child: SizedBox(
          height: 300.h,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController.value,
            children: const [OrdersTypesPage(), OrdersPage()],
          ),
        ),
      ),
    );
  }
}
