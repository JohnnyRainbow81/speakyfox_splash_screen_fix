import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'my_service.dart';
import 'my_service_test.mocks.dart';

@GenerateMocks([IRespository])
void main() {

  late final MockIRespository respository = MockIRespository();
  late final MyService service = MyService(repo: respository);

  test(
    "my class",
    () async{
      when(respository.doSomething(any)).thenAnswer((_) async =>Answer(answ: "good bye"));

      service.useRepo("Hello");
    },
  );
}
