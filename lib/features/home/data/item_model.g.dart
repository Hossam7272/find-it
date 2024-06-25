// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userId: json['user_id'] as String?,
      img: json['img'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      timeOfLost: json['time_of_lost'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'img': instance.img,
      'date': instance.date,
      'time': instance.time,
      'time_of_lost': instance.timeOfLost,
      'location': instance.location,
    };
