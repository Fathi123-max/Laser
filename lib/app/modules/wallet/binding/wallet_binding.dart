import 'package:get/get.dart';
import 'package:laser/app/modules/wallet/controller/walletController.dart';

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());
  }
}
