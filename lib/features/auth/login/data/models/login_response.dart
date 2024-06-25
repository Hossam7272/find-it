import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{
  String? status;
  UserData? data;
  LoginResponse({this.status, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  @override
  String toString() => 'User { data: $data , status : $status }';
}

@JsonSerializable()
class UserData {
  String? id;
  String? username;
  String? password;
  String? phone;

  UserData({this.id, this.username, this.password,this.phone});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}