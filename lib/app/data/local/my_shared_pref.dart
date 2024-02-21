import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/translations/localization_service.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _userTokenKey = 'user_token'; // user token = '';
  static const String _userMobileNUmber =
      'user_mobile_number'; // user token = '';
  static const String _onBoarding = 'onboarding'; // onboarding = '';
  static const String _deviceModelType = 'device_type';
  static const String _deviceType = 'device_model_type';
  static const String _deviceColor = 'device_color';
  static const String _deviceId = 'device_id';
  static const String _service = 'service_ids';
  static const String _deviceBrand = 'device_brand';
  static const String _orderId = 'order_id';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ??
      true; // todo set the default theme (true for light, false for dark)

  /// save current locale
  static Future<void> setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  /// save on boarding locale
  static Future<void> setOnboarding(String onBoarding) =>
      _sharedPreferences.setString(_onBoarding, onBoarding);

  /// save current token
  static Future<void> setCurrentToken(String token) => _sharedPreferences
      .setString(_userTokenKey, token)
      .then((value) => print('Set token: $token'));

  /// save current Mobile Number
  static Future<void> setCurrentMobileNumber(String mobileNumber) =>
      _sharedPreferences
          .setString(_userMobileNUmber, mobileNumber)
          .then((value) => print('Set mobile number: $mobileNumber'));
  static void saveDeviceModelType(String deviceModelType) => _sharedPreferences
      .setString(_deviceModelType, deviceModelType)
      .then((value) => print('Set device model type: $deviceModelType'));
  static void saveDeviceType(String deviceType) => _sharedPreferences
      .setString(_deviceType, deviceType)
      .then((value) => print('Set device type: $deviceType'));
  static void saveDeviceColor(String deviceColor) => _sharedPreferences
      .setString(_deviceColor, deviceColor)
      .then((value) => print('Set device color: $deviceColor'));
  static void saveDeviceId(String deviceId) => _sharedPreferences
      .setString(_deviceId, deviceId)
      .then((value) => print('Set device id: $deviceId'));
  static void saveService(List<String> services) => _sharedPreferences
      .setStringList(_service, services)
      .then((value) => print('Set service id: $services'));
  static void savedeviceBrand(String deviceBrandId) => _sharedPreferences
      .setString(_deviceBrand, deviceBrandId)
      .then((value) => print('Set device brand: $deviceBrandId'));
  static void saveOrderId(String orderId) => _sharedPreferences
      .setString(_orderId, orderId)
      .then((value) => print('Set device brand: $orderId'));

  /// get current locale
  static Locale getCurrentLocal() {
    String? langCode = _sharedPreferences.getString(_currentLocalKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  /// save generated fcm token
  static Future<void> setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  /// get authorization token
  static String? getFcmToken() => _sharedPreferences.getString(_fcmTokenKey);

  /// get current token
  static String? getCurrentToken() =>
      _sharedPreferences.getString(_userTokenKey);

  /// get on boarding
  static String? getOnBoarding() => _sharedPreferences.getString(_onBoarding);

  /// get current Mobile Number
  static String? getCurrentMobileNumber() =>
      _sharedPreferences.getString(_userMobileNUmber);

  /// get device Model type
  static String? getDeviceModelType() =>
      _sharedPreferences.getString(_deviceModelType);

  /// get device  type
  static String? getDeviceType() => _sharedPreferences.getString(_deviceType);

  /// get device type
  static String? getDeviceColor() => _sharedPreferences.getString(_deviceColor);
  static String? getDeviceId() => _sharedPreferences.getString(_deviceId);
  static List<String>? getServiceIds() =>
      _sharedPreferences.getStringList(_service);
  static String? getDeviceBrand() => _sharedPreferences.getString(_deviceBrand);
  static String? getOrderId() => _sharedPreferences.getString(_orderId);

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();
}
