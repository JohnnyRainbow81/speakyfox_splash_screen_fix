// Mocks generated by Mockito 5.3.0 from annotations
// in speakyfox/test/domain/services/mockito%20sanity%20test/my_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;

import 'my_service.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAnswer_0 extends _i1.SmartFake implements _i2.Answer {
  _FakeAnswer_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [IRespository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIRespository extends _i1.Mock implements _i2.IRespository {
  MockIRespository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.Answer> doSomething(_i2.Message? bla) =>
      (super.noSuchMethod(Invocation.method(#doSomething, [bla]),
              returnValue: _i3.Future<_i2.Answer>.value(
                  _FakeAnswer_0(this, Invocation.method(#doSomething, [bla]))))
          as _i3.Future<_i2.Answer>);
}
