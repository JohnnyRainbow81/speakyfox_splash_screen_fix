import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/send_password_reset_body.dart';
import 'package:speakyfox/domain/models/identity_token.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/repositories/authentication_repository.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';

import 'authentication_service_test.mocks.dart';

@GenerateMocks([AuthenticationRepository, AuthenticationRequestBody, User, Ticket, IdentityToken])
void main() async {
  late final MockAuthenticationRepository mockAuthenticationRepository;
  late final AuthenticationService authenticationService;

  mockAuthenticationRepository = MockAuthenticationRepository();
  authenticationService = AuthenticationService(mockAuthenticationRepository);

  test(
    "login",
    () async {
      when(mockAuthenticationRepository.accessToken(any)).thenAnswer((_) async => Ticket(
          accessToken: "123456", expiresIn: 3600, scope: "myScope", tokenType: "password", refreshToken: "ABCDEF"));

      when(mockAuthenticationRepository.fetchUser(any)).thenAnswer((_) async => MockUser());

      await authenticationService.login("test", "password123", true);

      IdentityToken token = authenticationService.getCredentials()!;
      expect(token, isNotNull);
      debugPrint("expires: ${token.expires}");
      expect(token.accessToken, "123456");
      expect(token.refreshToken, "ABCDEF");
      expect(token.user, isA<User>());
      expect(token.user, isNotNull);

      expect(authenticationService.isAuthenticated(), true);
      expect(authenticationService.isExpired(token), false);
    },
  );

  test(
    "isExpired()",
    () {
      //how to test privatemember variable that needs to be initialized first?
      // authenticationService.isExpired();
    },
  );

  test(
    "sendPasswordResetEmail()",
    () async {
      when(mockAuthenticationRepository.sendPasswordResetEmail(any)).thenAnswer((realInvocation) async => true);

      bool success = await authenticationService.sendPasswordResetEmail(SendPasswordResetBody(email: "bla")) ?? false;

      expect(success, true);
    },
  );

  test("refreshToken()", (() async {
    authenticationService
        .setCredentials(IdentityToken(expires: "3600", accessToken: "old", refreshToken: "old", user: MockUser()));

    when(mockAuthenticationRepository.refreshToken(any)).thenAnswer(
        (_) async => Ticket(accessToken: "new", expiresIn: 3600, scope: "", tokenType: "", refreshToken: "new"));

    await authenticationService.refreshToken();

    IdentityToken token = authenticationService.getCredentials()!;

    expect(token, isNotNull);
    expect(token.accessToken, "new");
    expect(token.refreshToken, "old");
    expect(token.user, isNotNull);
    expect(authenticationService.isExpired(token), false);
    expect(authenticationService.isAuthenticated(), true);
    debugPrint(token.expires);
  }));
}
