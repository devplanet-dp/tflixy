import 'package:json_annotation/json_annotation.dart';
part 'latest_model.g.dart';

@JsonSerializable()
class Latest{
  String homepage,name,original_name,poster_path;
  int id;

  Latest({this.homepage, this.name, this.original_name, this.poster_path,
      this.id});

  factory Latest.fromJson(Map<String,dynamic> json) => _$LatestFromJson(json);

  Map<String,dynamic> toJson() => _$LatestToJson(this);


}