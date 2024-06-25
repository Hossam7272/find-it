import 'package:json_annotation/json_annotation.dart';
part 'children_model.g.dart';

@JsonSerializable()
class ChildrenModel {
  String? status;
  @JsonKey(name: 'Data')
  List<childData>? data;

  ChildrenModel({this.status, this.data});
  factory ChildrenModel.fromJson(Map<String, dynamic> json) => _$ChildrenModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChildrenModelToJson(this);


}
@JsonSerializable()
class childData {
  String? id;
  String? name;
  String? location;
  @JsonKey(name: 'user_id')
  String? userId;
  String? date;
  String? time;
  String? img;
  String? gender;
  @JsonKey(name: 'time_of_lost')
  String? timeOfLost;

  childData(this.id, this.name, this.location, this.date, this.time, this.img,
      this.timeOfLost,this.gender);

  factory childData.fromJson(Map<String, dynamic> json) => _$childDataFromJson(json);
  Map<String, dynamic> toJson() => _$childDataToJson(this);



}
