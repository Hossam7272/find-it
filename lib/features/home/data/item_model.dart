import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String? status;
  List<Data>? data;

  ItemModel({this.status, this.data});
  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);


}
@JsonSerializable()
class Data {
  String? id;
  String? name;
  @JsonKey(name: 'user_id')
  String? userId;
  String? img;
  String? date;
  String? time;
  @JsonKey(name: 'time_of_lost')
  String? timeOfLost;
  String? location;

  Data(
      {this.id,
        this.name,
        this.userId,
        this.img,
        this.date,
        this.time,
        this.timeOfLost,
        this.location});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);



}
