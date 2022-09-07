import 'package:flutter_test/flutter_test.dart';
import 'package:speakyfox/data/dtos/user_dto.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/domain/models/role.dart';
import 'package:speakyfox/domain/models/user.dart';

void main() {
  test('user mapper ...', () async {
    User user = User(
        accessFailedAccount: 3,
        created: "bla",
        createdBy: "blub",
        currentLanguagePairId: "1234Id",
        currentSourceLanguageId: "56604Id",
        currentTargetLanguageId: "0593Id",
        deleted: "dfoaId",
        deletedBy: "iadid",
        email: "test@123.de",
        emailConfirmed: false,
        firstName: "Stefan",
        formOfAddress: "Herr",
        id: "0848189385sda",
        lastName: "Anders",
        lockoutEnabled: false,
        lockoutEnd: "whatever",
        modified: "ao3od2",
        modifiedBy: "asdl3l1",
        normalizedEmail: "normalized@email.de",
        normalizedUserName: "stefano",
        password: "123pass",
        policies: ["pol1", "pol2"],
        roles: [Role.Administrator, Role.ContentAssistent],
        subscriptionIds: ["sub123", "sub456"],
        userName: "Stefan81");

    UserDto userDto = user.toUserDto();

    User sameUser = userDto.toUser();

    expect(sameUser, equals(user));
    print("user: ${user.toString()}");
    print("sameUser: ${sameUser.toString()}");

  });
}
