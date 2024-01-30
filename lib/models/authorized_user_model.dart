import 'dart:convert';

class AuthorizedUser {
  String userId;
  String userName;
  String email;
  int gender;
  String firstName;
  String lastName;
  String passWord;
  String cId;
  DateTime dob;
  AuthorizedUser({
    required this.userId,
    required this.userName,
    required this.email,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.passWord,
    required this.cId,
    required this.dob,
  });

  //String token;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
    result.addAll({'email': email});
    result.addAll({'gender': gender});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'passWord': passWord});
    result.addAll({'cId': cId});
    result.addAll({'dob': dob.millisecondsSinceEpoch});

    return result;
  }

  factory AuthorizedUser.fromMap(Map<String, dynamic> map) {
    return AuthorizedUser(
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      passWord: map['passWord'] ?? '',
      cId: map['cId'] ?? '',
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorizedUser.fromJson(String source) =>
      AuthorizedUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthorizedUser(userId: $userId, userName: $userName, email: $email, gender: $gender, firstName: $firstName, lastName: $lastName, passWord: $passWord, cId: $cId, dob: $dob)';
  }
}
