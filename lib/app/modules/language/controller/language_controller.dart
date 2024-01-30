import 'package:get/get.dart';
import 'package:laser/app/config/translations/localization_service.dart';
import 'package:laser/app/routes/app_pages.dart';

class LanguageController extends GetxController {
  setLaunguage(String lang) async {
    await LocalizationService.updateLanguage(lang).then((value) {
      Get.offNamed(Routes.LoginPage);
    });
  }
}
