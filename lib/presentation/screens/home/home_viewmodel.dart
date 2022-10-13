import 'package:speakyfox/domain/models/class.dart';
import 'package:speakyfox/domain/services/class_service.dart';
import 'package:speakyfox/domain/services/user_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ClassService _classService;
  final UserService _userService;

  HomeViewModel(this._classService, this._userService);

  List<Class> _classes = [];

  List<Class> get classes => _classes;

  Future<void> init() async {
    await getClasses();
  }

  Future<void> getClasses() async {
    String languagePairId = _userService.user.currentLanguagePairId;
    _classes = await runBusyFuture(_classService.getAllByLanguagePairId(languagePairId));
  }
}
