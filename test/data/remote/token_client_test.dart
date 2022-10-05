import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/app/constants.dart';
import 'package:speakyfox/data/dio_factory.dart';
import 'package:speakyfox/data/mappers/ticket_mapper.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/data/remote/authentication_client.dart';
import 'package:speakyfox/data/remote/token_client.dart';
import 'package:speakyfox/data/requests/authentication_body.dart';
import 'package:speakyfox/data/requests/refresh_token_body.dart';
import 'package:speakyfox/domain/models/ticket.dart';
import 'package:speakyfox/domain/models/user.dart';
import 'package:speakyfox/domain/services/authentication_service.dart';

import '../../http_client_test_setup.dart';

void main() async {
  late User user;

  final tokenDio = DioFactory.initialize(baseUrl: Constants.baseUrlAuthQA);
  TokenClient tokenClient = TokenClient(tokenDio);

  final dio = DioFactory.initialize(baseUrl: TestConstants.baseUrlQA);
  AuthenticationClient authenticationClient = AuthenticationClient(dio);

  test('accessToken()', () async {
    final response = await tokenClient.accessToken(AuthenticationRequestBody(
        userName: "julien.ambos@ja-developer.de", password: "Peter123!", grantType: "password"));
    debugPrint("accessToken: ${response.accessToken}");
    debugPrint("refreshToken: ${response.refreshToken}");
  });

  test('fetchUser()', (() async {
    final response = await tokenClient.accessToken(AuthenticationRequestBody(
        userName: "julien.ambos@ja-developer.de", password: "Peter123!", grantType: "password"));
    Ticket ticket = response.toTicket();
    final userDto = await authenticationClient.fetchUser("Bearer ${ticket.accessToken}");
    user = userDto.data.toUser();

    debugPrint(user.firstName);
  }));

  test(
    "refreshToken()",
    () async {
      final response = await tokenClient.refreshToken(RefreshTokenBody(
          grantType: GrantType.refresh_token.name,
          refreshToken:
              "eyJhbGciOiJSU0EtT0FFUCIsImVuYyI6IkEyNTZDQkMtSFM1MTIiLCJraWQiOiIxQjFBNjJGNzcxRjhEQTVENURBNEUzMTlDRjc5MjVBNTU5MTlFNUFBIiwidHlwIjoib2lfcmVmdCtqd3QifQ.jxb45uM6KdNdc4gL4Kp88ACUaBCXwS4J5lmyRe9iMsGL9VicZx085oSrXSBBAixq-wb1t-na1SrJHQf1aT-XlBvO-i64_wrA06KugRYBKG3vTwjwseUvX75j2keTFNIH1Wq-Rr5AKh_kCHv88bWray64qIbJ4lFMKPSoAQWsBrC46TA4Dd2wpvMcPb8vvG8ExYHrzi-JMN402-UPSsrChV3lGwBJfLRBgC7dxj1K1aeW1IoXSWdp35VTCCJ1paZqdvMh9A9MKzqzoVFPpgtaP_Cofpnu_i3ZAcglX19U0qb1vzYBE6wti7J0EhHVJKvGy_4B-dqjXJBOGcqe1kBefA._O4veVDNHQ14mXSlmsRdhg.LTAhAYdziGpkOMYlb7Swv_yVHkmr8EamLPKU6b_ApaB6BaqbqZMr59-13xwTIdRAf4tt12Nt61SVPgZVYbuwUiMO0qI1DzNwTmRH8XJZtskK1iPJw00COcNwKrQ3FEHMBYhOsniXgbbZrlQeSo8zitYxgRMUy_R7hUnE6uFyuQDeS_qxMs23SOFnSOh4YGOUPhaGUrdsJWJErJb9blXK2YZvi_HDcD9PwqFeCX4cD-wgcDiFlBuJoWJu2OvOn6Qv_3YnkPNJojpGxGY5Tmj1WWGEc_gdWbG_qPV0U0KcBCBUIVNC8agrn5eWzoOt3gO4sF4BDlLaVPZaKfOkYqLd-dnYULbI9iyPMWw128QjN7SysIDfPYTCbPHWgTpBAVp31lS2mC4_UbtVmqM86f7_T11ieKM5gROu_P5TCpPj1XF-PUiX7Z6qw1cEjJ8cYjYO16M4Tyv3lwMZ3p8rU0BD8FNEUi-a1ccBFreZ8dy-9HXnnizd6S_m0N9lGSriqDO4ABB-NUQtsBmJA208DTgeQ6LEFB1b4JTGetrBhSQ3iTMDUAUiEzUFEtgzmHv_XuJqTVEh_Z1abBoDtth3ZIM16xBxtXVUP4aStvGpdzVEhwPQ6DsdO_ysFG60qcv23Hke_TFs-E7Q2J5g2Emj_bUaA8xIDIdaZJ1P_rkkCGyK9OusfXh8BHnNkFhIL51N-U6O6pmjnuJXjipCMwAq4_j5foaoKS4VfXp3xpl_m3-leKp2ZzmtT1mQI18YMp0VyQAASIxtYh3Kd14Tc-BW-RLQeWFIuDch-FSL6BBxEHLB7qwiLQxDYpb4RMMD6kqZ2GiQQNwNPQ8fjujHFKsPchbLj1J1wMRttW9RirgxWh8rrdWWDAjugCY_BaH9xxFs81dpPQCotd1PaUE7x3xz5AXrqybVMzKeZpy3IebLiTyn0JQKkRxwlCzb2q4i9f7-Sgs3rNkbA8bRC3SNyTbv-4SYcudZ_-UnO69ByfjGwwa3uGXxskTEgMoUyYgq_80lkViV5A8oF1YdmhcAnaW7EIUPCJYZbe78YUx8w8Ds4_f1veHJNynkYxA800a-CAcPoE6LKUhupeBJ5F_nevsCsVxCw_JzCOynvE5bHxhBIePl8qXjeQKjbnmsijUWSF16YBO8pEJLFoPoVRa8f0JyR5KAlnaubQE9Wmj6qnSkrENzSnKyp-I7VhepMK9azU1kDyFXGj3kwaEQpqiV4wC72vRpg1phr02Pqj_4ddpBGFZr68NJFd9IesUK4aNE7ZqOgSFF_ICcyhZkZZcFZft4iMYwnSvmO9K_eX0mtWXG0Ln6SeIsNeuhWwahz5aR9llCZW9eZGnyc9FVVwAOo-geOp70HSh9Pm8kCvYR_WaVWicL91WtzZ4517Ot_-g6NEpB_MiRliLNg6VHOCXyCtO5fJR4TK76UkWOyUYIJlrP1nHIs9VXkIhvRjqPZTRBN2VWoLyH3MZktd0P3DEH41gtYJoLjWvjoBNjun-bbOQL_pSX-a65l93CoDY1LYOkTkRn8hN69NkCFGUBwlfySU_wHrSHLgl6TuJqt6m0sjYZ1WAUCqk_C-JoSksBV6gKo0RzlJeU2CXNU-RAZvPqZHKtM6PJ1u-3CQd40lBjFUhShAQC80TT2fmif1GcJe14TnJQFa0AI_MK9dnbaQIMmVl7_kcsa5E_f0yjz98rv-D4yru8K5nQJqCRSiZ2VPT-v6uaeTCrIn4zBWIO30keoQRVHouSK1tetWPero8jL_fT0JVhNJZHnfec1HQvKtEAhB-UUkDjhF1dxQn9yVja5TMqlewPJZWzaDDcJcKvJOMH8FOhrb2XV7nrx_Xqn48eLAtkupXh.BtkMXdgw1isngib-KK6_fYntmeXlCJmAFbY5snrqvYg"));
      Ticket ticket = response.toTicket();
      debugPrint(ticket.toString());
    },
  );
  test('reset password', (() async {}));
}
