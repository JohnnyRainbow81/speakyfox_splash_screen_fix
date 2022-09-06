// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:speakyfox/app/constants.dart';

enum BuildFlavor { development, qa, production }

BuildEnvironment get env => _env;
late BuildEnvironment _env;

///Sets up external URLs for connecting to backend, paypal etc depending on
///build flavor (debug, profile, release)
class BuildEnvironment {
  static const String _keyProduction = "production";
  static const String _keyServerUrl = "serverUrl";
  static const String _keyServerUrlV2 = "serverUrlV2";
  static const String _keyDocumentrApiUrl = "documentrApiUrl";
  static const String _keyDocumentrApiKey = "documentrApiKey";
  static const String _keyDefaultLanguage = "defaultLanguage";
  static const String _keyPayPalClientId = "payPalClientId";
  static const String _keyEnvironmentName = "environmentName";
  static const String _keySupportedLanguages = "supportedLanguages";
  static const String _keyHmr = "hmr";

  final bool production;
  final String serverUrlAuth = Constants.baseUrlAuth;
  final String serverUrl;
  final String serverUrlV2;
  final String documentrApiUrl;
  final String documentrApiKey;
  final String defaultLanguage;
  final String payPalClientId;
  final String environmentName;
  final List<String> supportedLanguages;
  final bool hmr;

  final BuildFlavor flavor;

  BuildEnvironment._init(
      {required this.production,
      required this.serverUrl,
      required this.serverUrlV2,
      required this.documentrApiUrl,
      required this.documentrApiKey,
      required this.defaultLanguage,
      required this.payPalClientId,
      required this.environmentName,
      required this.supportedLanguages,
      required this.hmr,
      required this.flavor});

  static Future<void> init() async {
    Map<String, dynamic> map = {};
    if (kDebugMode || kProfileMode) { 
      String str = await rootBundle.loadString("assets/environments/qa.json");
      map = jsonDecode(str);
    } else if (kReleaseMode) {
      String str = await rootBundle.loadString("assets/environments/prod.json");
      map = jsonDecode(str);
    }
    _env = BuildEnvironment._init(
        production: map[_keyProduction],
        serverUrl: map[_keyServerUrl],
        serverUrlV2: map[_keyServerUrlV2],
        documentrApiUrl: map[_keyDocumentrApiUrl],
        documentrApiKey: map[_keyDocumentrApiKey],
        defaultLanguage: map[_keyDefaultLanguage],
        payPalClientId: map[_keyPayPalClientId],
        environmentName: map[_keyEnvironmentName],
        supportedLanguages: List<String>.from(map[_keySupportedLanguages]),
        hmr: map[_keyHmr],
        flavor: BuildFlavor.production);
  }

  

  @override
  String toString() {
    return 'BuildEnvironment(production: $production, serverUrl: $serverUrl, serverUrlV2: $serverUrlV2, documentrApiUrl: $documentrApiUrl, documentrApiKey: $documentrApiKey, defaultLanguage: $defaultLanguage, payPalClientId: $payPalClientId, environmentName: $environmentName, supportedLanguages: $supportedLanguages, hmr: $hmr, flavor: $flavor)';
  }
}
