// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildrenModel _$ChildrenModelFromJson(Map<String, dynamic> json) =>
    ChildrenModel(
      status: json['status'] as String?,
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => childData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChildrenModelToJson(ChildrenModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'Data': instance.data,
    };

childData _$childDataFromJson(Map<String, dynamic> json) => childData(
      json['id'] as String?,
      json['name'] as String?,
      json['location'] as String?,
      json['date'] as String?,
      json['time'] as String?,
      json['img'] as String?,
      json['time_of_lost'] as String?,
      json['gender'] as String?,
    )..userId = json['user_id'] as String?;

Map<String, dynamic> _$childDataToJson(childData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'user_id': instance.userId,
      'date': instance.date,
      'time': instance.time,
      'img': instance.img,
      'gender': instance.gender,
      'time_of_lost': instance.timeOfLost,
    };
