// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowDetail _$ShowDetailFromJson(Map<String, dynamic> json) {
  return ShowDetail(
      json['first_air_date'] as String,
      json['name'] as String,
      json['original_name'] as String,
      json['poster_path'] as String,
      json['vote_average'] as String,
      json['status'] as String,
      (json['genres'] as List)
          ?.map((e) =>
              e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['id'] as int,
      json['number_of_episodes'] as int,
      json['number_of_seasons'] as int);
}

Map<String, dynamic> _$ShowDetailToJson(ShowDetail instance) =>
    <String, dynamic>{
      'first_air_date': instance.first_air_date,
      'name': instance.name,
      'original_name': instance.original_name,
      'poster_path': instance.poster_path,
      'vote_average': instance.vote_average,
      'status': instance.status,
      'genres': instance.genres,
      'id': instance.id,
      'number_of_episodes': instance.number_of_episodes,
      'number_of_seasons': instance.number_of_seasons
    };
