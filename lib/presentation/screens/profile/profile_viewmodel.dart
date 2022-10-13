import 'package:speakyfox/data/requests/change_password_request.dart';
import 'package:speakyfox/data/requests/reset_password_body.dart';
import 'package:speakyfox/domain/models/class.dart';
import 'package:speakyfox/domain/models/language.dart';
import 'package:speakyfox/domain/models/language_pair.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';
import 'package:speakyfox/domain/services/class_service.dart';
import 'package:speakyfox/domain/services/language_service.dart';
import 'package:speakyfox/domain/services/subscription_service.dart';
import 'package:speakyfox/domain/services/user_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;
  final SubscriptionService _subscriptionService;
  final UserService _userService;
  final ClassService _classService;
  final LanguageService _languageService;

  ProfileViewModel(this._authenticationService, this._subscriptionService, this._userService, this._classService,
      this._languageService);

  Language? _sourceLanguage;
  Language? _targetLanguage;

  List<Subscription> _subscriptions = [];

  Language? get sourceLanguage => _sourceLanguage;
  Language? get targetLanguage => _targetLanguage;

  List<Subscription> get subscriptions => _subscriptions;

  Future<void> init() async {
    await getSubscriptions();
    await getLanguages();

    notifyListeners();
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    bool? success = await runBusyFuture<bool?>(_userService.changePassword(currentPassword, newPassword));
    return success ?? false;
  }

  Future<void> getSubscriptions() async {
    _subscriptions = await runBusyFuture<List<Subscription>?>(_userService.getSubscriptions()) ?? [];
  }

  Future<bool> cancelSubscription(String id) async {
    bool? success = await runBusyFuture<bool?>(_subscriptionService.cancel(id));
    return success ?? false;
  }

  Future<void> getLanguages() async {
    String sourceLanguageId = _userService.user.currentSourceLanguageId;
    String targetLanguageId = _userService.user.currentTargetLanguageId;

    _sourceLanguage = await runBusyFuture<Language?>(_languageService.getById(sourceLanguageId));
    _targetLanguage = await runBusyFuture<Language?>(_languageService.getById(targetLanguageId));
  }

  Future<void> chooseSourceLanguage(String sourceLanguageId) async {
    Language? newSourceLanguage = await runBusyFuture<Language?>(_languageService.getById(sourceLanguageId));
    _sourceLanguage = newSourceLanguage;
    notifyListeners();
  }

  Future<void> chooseTargetLanguage(String targetLanguageId) async {
    Language? newTargetLanguage = await runBusyFuture<Language?>(_languageService.getById(targetLanguageId));
    _targetLanguage = newTargetLanguage;
    notifyListeners();
  }

  Future<List<Class>> getClasses() async {
    List<Class>? classes = await runBusyFuture<List<Class>?>(_classService.getAll(""));
    return classes ?? [];
  }

  //ask Julien which purpose this call has!
  Future<void> patchLanguagePairBySourceTargetLanguageIds() async {
    LanguagePair? languagePair = await runBusyFuture<LanguagePair?>(
        _userService.patchLanguagePairBySourceTargetLanguagesIds(_sourceLanguage!.id, targetLanguage!.id));
  }

  Future<bool> logout() async {
    return await _authenticationService.logout();
  }
}
