import 'package:dio/dio.dart' hide Response;
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/dtos/subscription_dto.dart';
import 'package:speakyfox/data/dtos/user_address_dto.dart';
import 'package:speakyfox/data/dtos/user_details_dto.dart';
import 'package:speakyfox/data/dtos/user_payment_method_dto.dart';
import 'package:speakyfox/data/mappers/subscription_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/remote/user_client.dart';
import 'package:speakyfox/data/requests/create_user_request.dart';
import 'package:speakyfox/data/requests/subscription_create.dart';
import 'package:speakyfox/domain/models/payment_method.dart';
import 'package:speakyfox/domain/models/subscription.dart';
import 'package:speakyfox/domain/models/user.dart';

import '../../http_client_test_setup.dart';

void main() async {
  final dio = await getAuthenticatedHTTPClientForTesting();

  UserClient userClient = UserClient(dio, baseUrl: "${TestConstants.baseUrlQA}users/");

  test('createUser() throws 405', (() async {
    CreateProfileUserRequest request =
        CreateProfileUserRequest(firstname: "Lea", lastname: "D", email: "email", password: "123pass", affiliateId: "");

    expectLater(
        userClient.createUser(request.toJson()),
        throwsA(predicate(
            (f) => f is DioError && f.response?.statusCode == 405, "Forbidden to create User with this call")));
  }));

  test("getById", (() async {
    final response = await userClient.getById("64c4813e-68bf-4552-b8d9-7f8ce798a9ed"); //Julien Id
    User julien = response.data.toUser();
    debugPrint(julien.toString());
  }));

  test(
    "getOrdersOfCurrentClient() throws 403",
    //Should 403 be the answer here?? > ask Julien
    () async {
      expectLater(userClient.getOrdersOfCurrentUser("64c4813e-68bf-4552-b8d9-7f8ce798a9ed"),
          throwsA(predicate((f) => f is DioError && f.response?.statusCode == 403)));
    },
  );

  test(
    "getSubscriptions()",
    () async {
      final response = await userClient.getSubscriptions("64c4813e-68bf-4552-b8d9-7f8ce798a9ed");
      final subscriptions = response.data.map((e) => e.toSubscription()).toList();

      for (final subscription in subscriptions) {
        debugPrint(subscription.toString());
      }
    },
  );

  test(
    "changePassword() throws 400",
    //400 is OK here
    () async {
      Map<String, dynamic> request = {"currentPassword": "wrong_password_blabla", "password": "shouldn'tWork"};
      expectLater(userClient.changePassword(request),
          throwsA(predicate((f) => f is DioError && f.response?.statusCode == 400, "user/password couple is invalid")));
    },
  );

  test(
    'createSubscription',
    () async {
      final subscriptionRequest = SubscriptionDto(
          id: "",
          productDisplayTitle: "productDisplayTitle",
          planDisplayTitle: "planDisplayTitle",
          status: SubscriptionStatus.incomplete,
          currentPeriodStart: DateTime.now().toIso8601String(),
          currentPeriodEnd: DateTime.now().add(const Duration(days: 10)).toIso8601String(),
          couponKey: "",
          languages: [],
          interval: "",
          intervalCount: 5,
          paymentMethod:
              UserPaymentMethodDto(id: "550d2218-f8ef-410c-9524-438abe3e1e17", type: PaymentMethodType.payPal),
          nextBillingAmount: 100,
          invoices: []);

      final response =
          await userClient.createSubscription("64c4813e-68bf-4552-b8d9-7f8ce798a9ed", subscriptionRequest.toJson());

      final subscription = response.data.toSubscription();

      debugPrint(subscription.toString());
    },
  );
}


/* SubscriptionCreateRequest(
          coupon: "coupon",
          affiliateId: "",
          billingDetails: BillingDetailsRequest(
              address: AddressRequest(
                displayName: "displayName",
                value: "DE",
              ),
              email: "sdasd@sd.de",
              name: "Franz",
              phone: "01450304532"),
          externalId: "I-UYMUECC0D7HE",
          externalSubscriptionId: "4083c53c-9469-4cc0-a9d1-446113f12d1c",
          offerId: "7dfddc1e-c88e-431f-b576-5b7a5c1b29c2",
          paymentMethodId: "74f1eacb-ce5d-410b-95e9-eba59380056e",
          planId: "9d4d6877-ee24-4a6c-b0a2-3946e6756ae0") */