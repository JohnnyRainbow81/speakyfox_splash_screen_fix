import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/app/environment.dart';

import '../http_client_test_setup.dart';

void main() async {


  test('dependency injection ...', () async {
   TestWidgetsFlutterBinding.ensureInitialized();
   await BuildEnvironment.init();
   SharedPreferences.setMockInitialValues({});
   await  initializeDependencies();
  });
}
