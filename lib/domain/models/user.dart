// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/authentication.dart';

class User {
  String id;
  String formOfAddress;
  String firstName;
  String lastName;
  String email;
  String currentLanguagePairId;
  String currentSourceLanguageId;
  String currentTargetLanguageId;
  List<String> roles;
  List<String> subscriptionIds;

  User({
    required this.id,
    required this.formOfAddress,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.currentLanguagePairId,
    required this.currentSourceLanguageId,
    required this.currentTargetLanguageId,
    required this.roles,
    required this.subscriptionIds,
  });
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

