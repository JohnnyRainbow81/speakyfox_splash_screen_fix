// Mocks generated by Mockito 5.3.0 from annotations
// in speakyfox/test/domain/services/authentication_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:speakyfox/data/requests/authentication_body.dart' as _i7;
import 'package:speakyfox/data/requests/refresh_token_body.dart' as _i8;
import 'package:speakyfox/data/requests/reset_password_body.dart' as _i9;
import 'package:speakyfox/data/requests/send_password_reset_body.dart' as _i10;
import 'package:speakyfox/domain/models/identity_token.dart' as _i12;
import 'package:speakyfox/domain/models/lecture.dart' as _i4;
import 'package:speakyfox/domain/models/role.dart' as _i11;
import 'package:speakyfox/domain/models/ticket.dart' as _i2;
import 'package:speakyfox/domain/models/user.dart' as _i3;
import 'package:speakyfox/domain/repositories/authentication_repository.dart'
    as _i5;

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

class _FakeTicket_0 extends _i1.SmartFake implements _i2.Ticket {
  _FakeTicket_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeUser_1 extends _i1.SmartFake implements _i3.User {
  _FakeUser_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeLecture_2 extends _i1.SmartFake implements _i4.Lecture {
  _FakeLecture_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i5.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Ticket> accessToken(_i7.AuthenticationRequestBody? body) =>
      (super.noSuchMethod(Invocation.method(#accessToken, [body]),
              returnValue: _i6.Future<_i2.Ticket>.value(
                  _FakeTicket_0(this, Invocation.method(#accessToken, [body]))))
          as _i6.Future<_i2.Ticket>);
  @override
  _i6.Future<_i2.Ticket> refreshToken(_i8.RefreshTokenBody? body) =>
      (super.noSuchMethod(Invocation.method(#refreshToken, [body]),
              returnValue: _i6.Future<_i2.Ticket>.value(_FakeTicket_0(
                  this, Invocation.method(#refreshToken, [body]))))
          as _i6.Future<_i2.Ticket>);
  @override
  _i6.Future<_i3.User> fetchUser(String? authToken) => (super.noSuchMethod(
          Invocation.method(#fetchUser, [authToken]),
          returnValue: _i6.Future<_i3.User>.value(
              _FakeUser_1(this, Invocation.method(#fetchUser, [authToken]))))
      as _i6.Future<_i3.User>);
  @override
  _i6.Future<bool> resetPassword(String? userId, _i9.ResetPasswordBody? body) =>
      (super.noSuchMethod(Invocation.method(#resetPassword, [userId, body]),
          returnValue: _i6.Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> sendPasswordResetEmail(_i10.SendPasswordResetBody? body) =>
      (super.noSuchMethod(Invocation.method(#sendPasswordResetEmail, [body]),
          returnValue: _i6.Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i4.Lecture> getLastLecture(String? lectureId) =>
      (super.noSuchMethod(Invocation.method(#getLastLecture, [lectureId]),
              returnValue: _i6.Future<_i4.Lecture>.value(_FakeLecture_2(
                  this, Invocation.method(#getLastLecture, [lectureId]))))
          as _i6.Future<_i4.Lecture>);
  @override
  _i6.Future<_i4.Lecture> setLastLecture(String? lectureId) =>
      (super.noSuchMethod(Invocation.method(#setLastLecture, [lectureId]),
              returnValue: _i6.Future<_i4.Lecture>.value(_FakeLecture_2(
                  this, Invocation.method(#setLastLecture, [lectureId]))))
          as _i6.Future<_i4.Lecture>);
}

/// A class which mocks [AuthenticationRequestBody].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRequestBody extends _i1.Mock
    implements _i7.AuthenticationRequestBody {
  MockAuthenticationRequestBody() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get userName =>
      (super.noSuchMethod(Invocation.getter(#userName), returnValue: '')
          as String);
  @override
  set userName(String? _userName) =>
      super.noSuchMethod(Invocation.setter(#userName, _userName),
          returnValueForMissingStub: null);
  @override
  String get password =>
      (super.noSuchMethod(Invocation.getter(#password), returnValue: '')
          as String);
  @override
  set password(String? _password) =>
      super.noSuchMethod(Invocation.setter(#password, _password),
          returnValueForMissingStub: null);
  @override
  String get grantType =>
      (super.noSuchMethod(Invocation.getter(#grantType), returnValue: '')
          as String);
  @override
  set grantType(String? _grantType) =>
      super.noSuchMethod(Invocation.setter(#grantType, _grantType),
          returnValueForMissingStub: null);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i3.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get formOfAddress =>
      (super.noSuchMethod(Invocation.getter(#formOfAddress), returnValue: '')
          as String);
  @override
  set formOfAddress(String? _formOfAddress) =>
      super.noSuchMethod(Invocation.setter(#formOfAddress, _formOfAddress),
          returnValueForMissingStub: null);
  @override
  String get firstName =>
      (super.noSuchMethod(Invocation.getter(#firstName), returnValue: '')
          as String);
  @override
  set firstName(String? _firstName) =>
      super.noSuchMethod(Invocation.setter(#firstName, _firstName),
          returnValueForMissingStub: null);
  @override
  String get lastName =>
      (super.noSuchMethod(Invocation.getter(#lastName), returnValue: '')
          as String);
  @override
  set lastName(String? _lastName) =>
      super.noSuchMethod(Invocation.setter(#lastName, _lastName),
          returnValueForMissingStub: null);
  @override
  String get email =>
      (super.noSuchMethod(Invocation.getter(#email), returnValue: '')
          as String);
  @override
  set email(String? _email) =>
      super.noSuchMethod(Invocation.setter(#email, _email),
          returnValueForMissingStub: null);
  @override
  String get normalizedEmail =>
      (super.noSuchMethod(Invocation.getter(#normalizedEmail), returnValue: '')
          as String);
  @override
  set normalizedEmail(String? _normalizedEmail) =>
      super.noSuchMethod(Invocation.setter(#normalizedEmail, _normalizedEmail),
          returnValueForMissingStub: null);
  @override
  bool get emailConfirmed => (super
          .noSuchMethod(Invocation.getter(#emailConfirmed), returnValue: false)
      as bool);
  @override
  set emailConfirmed(bool? _emailConfirmed) =>
      super.noSuchMethod(Invocation.setter(#emailConfirmed, _emailConfirmed),
          returnValueForMissingStub: null);
  @override
  String get userName =>
      (super.noSuchMethod(Invocation.getter(#userName), returnValue: '')
          as String);
  @override
  set userName(String? _userName) =>
      super.noSuchMethod(Invocation.setter(#userName, _userName),
          returnValueForMissingStub: null);
  @override
  String get normalizedUserName => (super
          .noSuchMethod(Invocation.getter(#normalizedUserName), returnValue: '')
      as String);
  @override
  set normalizedUserName(String? _normalizedUserName) => super.noSuchMethod(
      Invocation.setter(#normalizedUserName, _normalizedUserName),
      returnValueForMissingStub: null);
  @override
  int get accessFailedAccount => (super
          .noSuchMethod(Invocation.getter(#accessFailedAccount), returnValue: 0)
      as int);
  @override
  set accessFailedAccount(int? _accessFailedAccount) => super.noSuchMethod(
      Invocation.setter(#accessFailedAccount, _accessFailedAccount),
      returnValueForMissingStub: null);
  @override
  bool get lockoutEnabled => (super
          .noSuchMethod(Invocation.getter(#lockoutEnabled), returnValue: false)
      as bool);
  @override
  set lockoutEnabled(bool? _lockoutEnabled) =>
      super.noSuchMethod(Invocation.setter(#lockoutEnabled, _lockoutEnabled),
          returnValueForMissingStub: null);
  @override
  String get password =>
      (super.noSuchMethod(Invocation.getter(#password), returnValue: '')
          as String);
  @override
  set password(String? _password) =>
      super.noSuchMethod(Invocation.setter(#password, _password),
          returnValueForMissingStub: null);
  @override
  String get lockoutEnd =>
      (super.noSuchMethod(Invocation.getter(#lockoutEnd), returnValue: '')
          as String);
  @override
  set lockoutEnd(String? _lockoutEnd) =>
      super.noSuchMethod(Invocation.setter(#lockoutEnd, _lockoutEnd),
          returnValueForMissingStub: null);
  @override
  List<_i11.Role> get roles =>
      (super.noSuchMethod(Invocation.getter(#roles), returnValue: <_i11.Role>[])
          as List<_i11.Role>);
  @override
  set roles(List<_i11.Role>? _roles) =>
      super.noSuchMethod(Invocation.setter(#roles, _roles),
          returnValueForMissingStub: null);
  @override
  List<String> get policies =>
      (super.noSuchMethod(Invocation.getter(#policies), returnValue: <String>[])
          as List<String>);
  @override
  set policies(List<String>? _policies) =>
      super.noSuchMethod(Invocation.setter(#policies, _policies),
          returnValueForMissingStub: null);
  @override
  String get currentLanguagePairId =>
      (super.noSuchMethod(Invocation.getter(#currentLanguagePairId),
          returnValue: '') as String);
  @override
  set currentLanguagePairId(String? _currentLanguagePairId) =>
      super.noSuchMethod(
          Invocation.setter(#currentLanguagePairId, _currentLanguagePairId),
          returnValueForMissingStub: null);
  @override
  String get currentSourceLanguageId =>
      (super.noSuchMethod(Invocation.getter(#currentSourceLanguageId),
          returnValue: '') as String);
  @override
  set currentSourceLanguageId(String? _currentSourceLanguageId) =>
      super.noSuchMethod(
          Invocation.setter(#currentSourceLanguageId, _currentSourceLanguageId),
          returnValueForMissingStub: null);
  @override
  String get currentTargetLanguageId =>
      (super.noSuchMethod(Invocation.getter(#currentTargetLanguageId),
          returnValue: '') as String);
  @override
  set currentTargetLanguageId(String? _currentTargetLanguageId) =>
      super.noSuchMethod(
          Invocation.setter(#currentTargetLanguageId, _currentTargetLanguageId),
          returnValueForMissingStub: null);
  @override
  List<String> get subscriptionIds =>
      (super.noSuchMethod(Invocation.getter(#subscriptionIds),
          returnValue: <String>[]) as List<String>);
  @override
  set subscriptionIds(List<String>? _subscriptionIds) =>
      super.noSuchMethod(Invocation.setter(#subscriptionIds, _subscriptionIds),
          returnValueForMissingStub: null);
  @override
  set id(String? _id) => super.noSuchMethod(Invocation.setter(#id, _id),
      returnValueForMissingStub: null);
  @override
  set modified(String? _modified) =>
      super.noSuchMethod(Invocation.setter(#modified, _modified),
          returnValueForMissingStub: null);
  @override
  set modifiedBy(String? _modifiedBy) =>
      super.noSuchMethod(Invocation.setter(#modifiedBy, _modifiedBy),
          returnValueForMissingStub: null);
  @override
  set created(String? _created) =>
      super.noSuchMethod(Invocation.setter(#created, _created),
          returnValueForMissingStub: null);
  @override
  set createdBy(String? _createdBy) =>
      super.noSuchMethod(Invocation.setter(#createdBy, _createdBy),
          returnValueForMissingStub: null);
  @override
  set deleted(String? _deleted) =>
      super.noSuchMethod(Invocation.setter(#deleted, _deleted),
          returnValueForMissingStub: null);
  @override
  set deletedBy(String? _deletedBy) =>
      super.noSuchMethod(Invocation.setter(#deletedBy, _deletedBy),
          returnValueForMissingStub: null);
}

/// A class which mocks [Ticket].
///
/// See the documentation for Mockito's code generation for more information.
class MockTicket extends _i1.Mock implements _i2.Ticket {
  MockTicket() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get accessToken =>
      (super.noSuchMethod(Invocation.getter(#accessToken), returnValue: '')
          as String);
  @override
  set accessToken(String? _accessToken) =>
      super.noSuchMethod(Invocation.setter(#accessToken, _accessToken),
          returnValueForMissingStub: null);
  @override
  int get expiresIn =>
      (super.noSuchMethod(Invocation.getter(#expiresIn), returnValue: 0)
          as int);
  @override
  set expiresIn(int? _expiresIn) =>
      super.noSuchMethod(Invocation.setter(#expiresIn, _expiresIn),
          returnValueForMissingStub: null);
  @override
  set refreshToken(String? _refreshToken) =>
      super.noSuchMethod(Invocation.setter(#refreshToken, _refreshToken),
          returnValueForMissingStub: null);
  @override
  String get scope =>
      (super.noSuchMethod(Invocation.getter(#scope), returnValue: '')
          as String);
  @override
  set scope(String? _scope) =>
      super.noSuchMethod(Invocation.setter(#scope, _scope),
          returnValueForMissingStub: null);
  @override
  String get tokenType =>
      (super.noSuchMethod(Invocation.getter(#tokenType), returnValue: '')
          as String);
  @override
  set tokenType(String? _tokenType) =>
      super.noSuchMethod(Invocation.setter(#tokenType, _tokenType),
          returnValueForMissingStub: null);
}

/// A class which mocks [IdentityToken].
///
/// See the documentation for Mockito's code generation for more information.
class MockIdentityToken extends _i1.Mock implements _i12.IdentityToken {
  MockIdentityToken() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get expires =>
      (super.noSuchMethod(Invocation.getter(#expires), returnValue: '')
          as String);
  @override
  set expires(String? _expires) =>
      super.noSuchMethod(Invocation.setter(#expires, _expires),
          returnValueForMissingStub: null);
  @override
  String get accessToken =>
      (super.noSuchMethod(Invocation.getter(#accessToken), returnValue: '')
          as String);
  @override
  set accessToken(String? _accessToken) =>
      super.noSuchMethod(Invocation.setter(#accessToken, _accessToken),
          returnValueForMissingStub: null);
  @override
  String get refreshToken =>
      (super.noSuchMethod(Invocation.getter(#refreshToken), returnValue: '')
          as String);
  @override
  set refreshToken(String? _refreshToken) =>
      super.noSuchMethod(Invocation.setter(#refreshToken, _refreshToken),
          returnValueForMissingStub: null);
  @override
  _i3.User get user => (super.noSuchMethod(Invocation.getter(#user),
      returnValue: _FakeUser_1(this, Invocation.getter(#user))) as _i3.User);
  @override
  set user(_i3.User? _user) =>
      super.noSuchMethod(Invocation.setter(#user, _user),
          returnValueForMissingStub: null);
}