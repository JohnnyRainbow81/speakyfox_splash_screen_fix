import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/mappers/order_mapper.dart';
import 'package:speakyfox/data/remote/order_client.dart';
import 'package:dio/dio.dart';
import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

  OrderClient orderClient = OrderClient(dio, baseUrl: "${TestConstants.baseUrlQA}users/64c4813e-68bf-4552-b8d9-7f8ce798a9ed/orders");
  group(
    OrderClient,
    () {
      test(
        'createOrder / missing privileges',
        () async {
          //Future<Response<OrderDto>> createOrder(@Path() String userId, @Body() Map<String, dynamic> order);
          expect(orderClient.createOrder("64c4813e-68bf-4552-b8d9-7f8ce798a9ed", {}), throwsException);
        },
      );

      test(
        'getAll',
        () async {
          //missing privileges
          expect(orderClient.getAll(""), throwsException);
        },
      );
    },
  );
}
