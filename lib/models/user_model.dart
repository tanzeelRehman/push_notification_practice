// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? user_id;
  String user_name;
  String user_email;
  String user_device_token;
  UserModel({
    this.user_id,
    required this.user_name,
    required this.user_email,
    required this.user_device_token,
  });

  UserModel copyWith({
    String? user_id,
    String? user_name,
    String? user_email,
    String? user_device_token,
  }) {
    return UserModel(
      user_id: user_id ?? this.user_id,
      user_name: user_name ?? this.user_name,
      user_email: user_email ?? this.user_email,
      user_device_token: user_device_token ?? this.user_device_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'user_email': user_email,
      'user_device_token': user_device_token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        user_id: map['user_id'] != null ? map['user_id'] as String : null,
        user_name: map['user_name'] as String,
        user_email: map['user_email'] as String,
        user_device_token: map['user_device_token'] as String);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(user_id: $user_id, user_name: $user_name, user_email: $user_email, user_device_token: $user_device_token)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.user_id == user_id &&
        other.user_name == user_name &&
        other.user_email == user_email &&
        other.user_device_token == user_device_token;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^
        user_name.hashCode ^
        user_email.hashCode ^
        user_device_token.hashCode;
  }
}
