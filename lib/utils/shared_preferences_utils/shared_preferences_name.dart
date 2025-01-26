// ignore_for_file: constant_identifier_names

part of 'shared_preferences_utils.dart';

abstract class SharedPrefName {
  SharedPrefName._();

  static const ONBOARDING = "OnBoarding";
  static const ACCOUNT = "Account";
  static const REFRESHTOKEN = "RefreshToken";
  static const ACCESSTOKEN = "AccessToken";
}