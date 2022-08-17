import 'package:json_serializable/type_helper.dart';
import 'package:speakyfox/data/responses/user_response.dart';
import 'package:speakyfox/domain/models/role.dart';

import '../../domain/models/user.dart';

extension UserResponseMapper on UserResponse {
  User toUser() {
    return User(
      currentLanguagePairId: currentLanguagePairId ?? "",
      currentSourceLanguageId: currentSourceLanguageId ?? "",
      currentTargetLanguageId: currentTargetLanguageId ?? "",
      email: email ?? "",
      emailConfirmed: emailConfirmed ?? false,
      normalizedEmail: normalizedEmail ?? "",
      userName: userName ?? "",
      normalizedUserName: normalizedUserName ?? "",
      password: password ?? "",
      policies: policies ?? [],
      lockoutEnabled: lockoutEnabled ?? false,
      lockoutEnd: lockoutEnd ?? "",
      firstName: firstname ?? "",
      lastName: lastname ?? "",
      formOfAddress: formOfAddress ?? "",
      id: id ?? "",
      roles: roles?.map((roleStr) => Role.values.byName(roleStr)).toList() ?? [],
      subscriptionIds: subscriptionIds?.toList() ?? [],
      accessFailedAccount: accessFailedAccount ?? 0,
      created: created ?? "",
      createdBy: createdBy ?? "",
      modified: modified ?? "",
      modifiedBy: modifiedBy ?? "",
      deleted: deleted ?? "",
      deletedBy: deletedBy ?? "",
    );
  }
}
