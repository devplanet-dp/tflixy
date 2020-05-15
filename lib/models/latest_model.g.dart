// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Latest _$LatestFromJson(Map<String, dynamic> json) {
  return Latest(
      homepage: json['homepage'] as String,
      name: json['name'] as String,
      original_name: json['original_name'] as String,
      poster_path: json['poster_path'] as String,
      id: json['id'] as int);
}

Map<String, dynamic> _$LatestToJson(Latest instance) => <String, dynamic>{
      'homepage': instance.homepage,
      'name': instance.name,
      'original_name': instance.original_name,
      'poster_path': instance.poster_path,
      'id': instance.id
    };
