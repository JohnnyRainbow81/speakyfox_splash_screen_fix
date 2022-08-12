import 'package:speakyfox/data/responses/user_response.dart';

import '../../domain/models/user.dart';

extension UserResponseMapper on UserResponse {
  User toUser() {
    return User(
      currentLanguagePairId: data?.currentLanguagePairId ?? "",
      currentSourceLanguageId: data?.currentSourceLanguageId ?? "",
      currentTargetLanguageId: data?.currentTargetLanguageId ?? "",
      email: data?.email ?? "",
      firstName: data?.firstname ?? "",
      lastName: data?.lastname ?? "",
      formOfAddress: data?.formOfAddress ?? "",
      id: data?.id ?? "",
      roles: data?.roles?.toList() ?? [],
      subscriptionIds: data?.subscriptionIds?.toList() ?? [],
    );
  }
}
