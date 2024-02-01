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
  static Future<void> setCurrentToken(String token) =>
      _sharedPreferences.setString(_userTokenKey, token);

  /// save current Mobile Number
  static Future<void> setCurrentMobileNumber(String mobileNumber) =>
      _sharedPreferences.setString(_userMobileNUmber, mobileNumber);

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

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();
}
