import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/refresh_token_body.dart';
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

      await authenticationService.login("test", "password123");

      expect(authenticationService.credentials, isNotNull);
      debugPrint("expires: ${authenticationService.credentials?.expires}");
      expect(authenticationService.credentials?.accessToken, "123456");
      expect(authenticationService.credentials?.refreshToken, "ABCDEF");
      expect(authenticationService.credentials?.user, isA<User>());
      expect(authenticationService.credentials?.user, isNotNull);

      expect(authenticationService.isAuthenticated(), true);
      expect(authenticationService.isExpired(), false);
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
      when(mockAuthenticationRepository.sendPasswordResetEmail(any))
          .thenAnswer((realInvocation) async => true);
      
      bool success = await authenticationService.sendPasswordResetEmail(SendPasswordResetBody(email: "bla"));

      expect(success, true);
    },
  );

  test("refreshToken()", (() async {
    authenticationService.setCredentials =
        IdentityToken(expires: "3600", accessToken: "old", refreshToken: "old", user: MockUser());

    when(mockAuthenticationRepository.refreshToken(any)).thenAnswer(
        (_) async => Ticket(accessToken: "new", expiresIn: 3600, scope: "", tokenType: "", refreshToken: "new"));

    await authenticationService.refreshToken();

    expect(authenticationService.credentials, isNotNull);
    expect(authenticationService.credentials!.accessToken, "new");
    expect(authenticationService.credentials!.refreshToken, "old");
    expect(authenticationService.credentials!.user, isNotNull);
    expect(authenticationService.isExpired(), false);
    expect(authenticationService.isAuthenticated(), true);
    debugPrint(authenticationService.credentials!.expires);
  }));
}
