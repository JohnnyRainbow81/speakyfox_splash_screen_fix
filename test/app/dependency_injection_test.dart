import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakyfox/app/environment.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await BuildEnvironment.init();
  SharedPreferences.setMockInitialValues({});

  test('dependency injection ...', () async {
   //TODO
  });
}
