import 'package:json_annotation/json_annotation.dart';
part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel{
  String? id;
  String? senderId;
  String? receiverId;
  List chat = [];

  ChatModel(this.id, this.senderId, this.receiverId, this.chat);

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);


}