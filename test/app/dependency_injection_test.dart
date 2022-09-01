import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/dependency_injection.dart';
import 'package:speakyfox/app/environment.dart';

import '../test_get_access_token.dart';

void main() async {

  String token = await getAuthTokenForTesting();

  test('dependency injection ...', () async {
   TestWidgetsFlutterBinding.ensureInitialized();
   await BuildEnvironment.init();
   SharedPreferences.setMockInitialValues({});
   await  initializeDependencies(token);
  });
}
