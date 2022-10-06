import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/mappers/product_mapper.dart';
import 'package:speakyfox/data/remote/product_client.dart';
import 'package:dio/dio.dart';
import '../../http_client_test_setup.dart';

void main() async {
  Dio dio = await getAuthenticatedHTTPClientForTesting();

  ProductClient productClient = ProductClient(dio, baseUrl: "${TestConstants.baseUrlQA}products");
  group(
    ProductClient,
    () {
      test(
        'getById',
        () async {
          final response = await productClient.getById("1b12b96e-9c85-413a-9fd9-fea850f5bec5");
          final product = response.data.toProduct();

          debugPrint(product.toString());
        },
      );
      test(
        'getAll',
        () async {
           final response = await productClient.getAll("");
          final products = response.data.map((e) => e.toProduct()).toList();
          for(final product in products) {
            debugPrint(product.toString());
          }
        },
      );
    },
  );
}
