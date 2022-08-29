// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/model_base.dart';
import 'package:speakyfox/domain/models/role.dart';

class User extends ModelBase {
  //String id;
  String formOfAddress;
  String firstName;
  String lastName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  String userName;
  String normalizedUserName;
  int accessFailedAccount;
  bool lockoutEnabled;
  String password;
  String lockoutEnd;
  List<Role> roles;
  List<String> policies;
  String currentLanguagePairId;
  String currentSourceLanguageId;
  String currentTargetLanguageId;
  List<String> subscriptionIds;

  User({
    required String id,
    required String modified,
    required String modifiedBy,
    required String created,
    required String createdBy,
    required String deleted,
    required String deletedBy,
    required this.formOfAddress,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
    required this.userName,
    required this.normalizedUserName,
    required this.accessFailedAccount,
    required this.lockoutEnabled,
    required this.password,
    required this.lockoutEnd,
    required this.roles,
    required this.policies,
    required this.currentLanguagePairId,
    required this.currentSourceLanguageId,
    required this.currentTargetLanguageId,
    required this.subscriptionIds,
  }) : super(
            id: id,
            modified: modified,
            modifiedBy: modifiedBy,
            created: created,
            createdBy: createdBy,
            deleted: deleted,
            deletedBy: deletedBy);

  @override
  String toString() {
    return 'User(formOfAddress: $formOfAddress, firstName: $firstName, lastName: $lastName, email: $email, normalizedEmail: $normalizedEmail, emailConfirmed: $emailConfirmed, userName: $userName, normalizedUserName: $normalizedUserName, accessFailedAccount: $accessFailedAccount, lockoutEnabled: $lockoutEnabled, password: $password, lockoutEnd: $lockoutEnd, roles: $roles, policies: $policies, currentLanguagePairId: $currentLanguagePairId, currentSourceLanguageId: $currentSourceLanguageId, currentTargetLanguageId: $currentTargetLanguageId, subscriptionIds: $subscriptionIds)';
  }
}


//  "id": "1c796ae2-b521-4128-9875-59785ed932d2",
//   "formOfAddress": "Unknown",
//   "firstname": "",
//   "lastname": "Stefan",
//   "email": "Stefan_anders@gmx.net",
//   "currentLanguagePairId": "649b2515-386f-4bb3-81ca-24f4c883b3aa",
//   "currentSourceLanguageId": "02c6e388-bcb1-427b-8b8d-d49704671c22",
//   "currentTargetLanguageId": "067ab4d6-fb38-4f82-bda6-2daa217e9ed2",
//   "roles": [
//     "User"
//   ],
//   "subscriptionIds": []

