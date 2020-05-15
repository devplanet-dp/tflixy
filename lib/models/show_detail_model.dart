import 'package:tflixy/models/genre_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'show_detail_model.g.dart';


@JsonSerializable()
class ShowDetail{
  final String first_air_date,name,original_name,poster_path,vote_average,status;
  final List<Genre> genres;
  final int id,number_of_episodes,number_of_seasons;

  ShowDetail(this.first_air_date, this.name, this.original_name,
      this.poster_path, this.vote_average, this.status, this.genres, this.id,
      this.number_of_episodes, this.number_of_seasons);

  factory ShowDetail.fromJson(Map<String,dynamic> json) => _$ShowDetailFromJson(json);

  Map<String,dynamic> toJson() => _$ShowDetailToJson(this);


}