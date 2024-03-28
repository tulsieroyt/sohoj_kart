import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sohoj_kart/utils/formatters/formatter.dart';

class UserModel {
  //Keep this values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get full name
  String get fullName => '$firstName $lastName';

  ///Helper function to format phone number
  String get formattedPhoneNumber => SKFormatter.formatPhoneNumber(phoneNumber);

  ///Static function to split full name to first name and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  ///Static function to generate a username from the full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName";
    String userNameWithFixedPrefix = "cwt_$camelCaseUserName";
    return userNameWithFixedPrefix;
  }

  ///Static function to create a empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  ///Convert model to JSON structure for storing data to Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

  ///Factory method to create a UserModel from the Firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        userName: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
