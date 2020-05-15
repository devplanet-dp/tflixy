// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(id: json['id'] as int, name: json['name'] as String);
}

Map<String, dynamic> _$GenreToJson(Genre instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

GenreList _$GenreListFromJson(Map<String, dynamic> json) {
  return GenreList(
      genreList: (json['genreList'] as List)
          ?.map((e) =>
              e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$GenreListToJson(GenreList instance) =>
    <String, dynamic>{'genreList': instance.genreList};
