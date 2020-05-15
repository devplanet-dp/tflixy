import 'package:json_annotation/json_annotation.dart';
part 'genre_model.g.dart';


@JsonSerializable()
class Genre{
  int id;
  String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String,dynamic> json) => _$GenreFromJson(json);

  Map<String,dynamic> toJson() => _$GenreToJson(this);




}
@JsonSerializable()
class GenreList{
  List<Genre> genreList;

  GenreList({this.genreList});

  factory GenreList.fromJson(List<dynamic> json){
    return GenreList(
      genreList: json
          .map((e) => Genre.fromJson(e as Map<String,dynamic>))
          .toList()
    );
  }


}