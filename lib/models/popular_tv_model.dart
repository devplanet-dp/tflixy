import 'package:json_annotation/json_annotation.dart';
part 'popular_tv_model.g.dart';

@JsonSerializable()
class PopularTv{

  final String original_name,name,first_air_date,backdrop_path,original_language,overview,poster_path;
  final double popularity,vote_average;
  final int vote_count,id;
  final List<int> genre_ids;


  PopularTv({this.original_name, this.name, this.first_air_date,
      this.backdrop_path, this.original_language, this.overview,
      this.poster_path, this.popularity, this.vote_average, this.vote_count,
      this.id, this.genre_ids});

  factory PopularTv.fromJson(Map<String,dynamic> json) => _$PopularTvFromJson(json);

  Map<String,dynamic> toJson() => _$PopularTvToJson(this);

}
@JsonSerializable()
class PopularTvList{
  List<PopularTv> tvList;

  PopularTvList({this.tvList});

  factory PopularTvList.fromJson(List<dynamic> json){
    return PopularTvList(
      tvList: json
          .map((e) => PopularTv.fromJson(e as Map<String,dynamic>))
          .toList()
    );
  }


}