import 'package:find_it/features/auth/login/data/models/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';


@JsonSerializable()
class User {
  String? id;
  String? name;
  String? username;
  String? email;
  String? country;
  String? password;
  String? phone;
  String? date;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.country,
        this.password,
        this.phone,
        this.date});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
