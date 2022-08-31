import 'package:speakyfox/data/dtos/user_dto.dart';
import 'package:speakyfox/domain/models/role.dart';

import '../../domain/models/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      currentLanguagePairId: currentLanguagePairId ?? "",
      currentSourceLanguageId: currentSourceLanguageId ?? "",
      currentTargetLanguageId: currentTargetLanguageId ?? "",
      email: email,
      emailConfirmed: emailConfirmed ?? false,
      normalizedEmail: normalizedEmail ?? "",
      userName: userName ?? "",
      normalizedUserName: normalizedUserName ?? "",
      password: password ?? "",
      policies: policies ?? [],
      lockoutEnabled: lockoutEnabled ?? false,
      lockoutEnd: lockoutEnd ?? "",
      firstName: firstName ?? "",
      lastName: lastName ?? "",
      formOfAddress: formOfAddress ?? "",
      id: id,
      roles: roles?.map((roleStr) => Role.values.byName(roleStr.toLowerCase())).toList() ??
          [], //Convert uppercase String (like "User") to lowercase enum
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

extension UserDtoMapper on User {
  UserDto toUserDto() {
    return UserDto(
        id: id ?? "",
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        formOfAddress: formOfAddress,
        firstName: firstName,
        lastName: lastName,
        email: email,
        normalizedEmail: normalizedEmail,
        emailConfirmed: emailConfirmed,
        userName: userName,
        normalizedUserName: normalizedUserName,
        accessFailedAccount: accessFailedAccount,
        lockoutEnabled: lockoutEnabled,
        password: password,
        lockoutEnd: lockoutEnd,
        roles: roles.map((role) => role.name).toList(),
        policies: policies,
        currentLanguagePairId: currentLanguagePairId,
        currentSourceLanguageId: currentSourceLanguageId,
        currentTargetLanguageId: currentTargetLanguageId,
        subscriptionIds: subscriptionIds);
  }
}
