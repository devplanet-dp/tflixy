// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_tv_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularTv _$PopularTvFromJson(Map<String, dynamic> json) {
  return PopularTv(
      original_name: json['original_name'] as String,
      name: json['name'] as String,
      first_air_date: json['first_air_date'] as String,
      backdrop_path: json['backdrop_path'] as String,
      original_language: json['original_language'] as String,
      overview: json['overview'] as String,
      poster_path: json['poster_path'] as String,
      popularity: (json['popularity'] as num)?.toDouble(),
      vote_average: (json['vote_average'] as num)?.toDouble(),
      vote_count: json['vote_count'] as int,
      id: json['id'] as int,
      genre_ids: (json['genre_ids'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$PopularTvToJson(PopularTv instance) => <String, dynamic>{
      'original_name': instance.original_name,
      'name': instance.name,
      'first_air_date': instance.first_air_date,
      'backdrop_path': instance.backdrop_path,
      'original_language': instance.original_language,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'popularity': instance.popularity,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
      'id': instance.id,
      'genre_ids': instance.genre_ids
    };

PopularTvList _$PopularTvListFromJson(Map<String, dynamic> json) {
  return PopularTvList(
      tvList: (json['tvList'] as List)
          ?.map((e) =>
              e == null ? null : PopularTv.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PopularTvListToJson(PopularTvList instance) =>
    <String, dynamic>{'tvList': instance.tvList};
