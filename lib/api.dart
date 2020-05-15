
import 'package:tflixy/network.dart';

const String apiKey = "6b7646fd12df2a86890c7630bfbfba68";

const String baseUrl = "https://api.themoviedb.org/3";

const String tvPopularUrl ="$baseUrl/tv/popular?api_key=$apiKey&language=en-US&page=1";
const String genreUrl ="$baseUrl/genre/tv/list?api_key=$apiKey&language=en-US";
const String tvLatest ="$baseUrl/tv/latest?api_key=$apiKey&language=en-US";
const String tvTopRated ="$baseUrl/tv/top_rated?api_key=$apiKey&language=en-US&page=1";
const String tvAiringToday ="$baseUrl/tv/airing_today?api_key=$apiKey&language=en-US&page=1";

class Api{

  Future<dynamic> getPopularTvShows() async{
    Network network = Network(tvPopularUrl);

    var tvPopularData = await network.getData();
    return tvPopularData;
  }
  Future<dynamic> getGenres() async{

    Network network = Network(genreUrl);

    var genreData = await network.getData();
    return genreData;

  }
  Future<dynamic> getLatestTV() async{
    Network network = Network(tvLatest);

    var latestData = await network.getData();
    return latestData;
  }
  Future<dynamic> getTopRatedTV() async{
    Network network = Network(tvTopRated);

    var data = await network.getData();
    return data;
  }
  Future<dynamic> getAiringToday() async{
    Network network = Network(tvAiringToday);
    var data = await network.getData();
    return data;
  }
  Future<dynamic> getShowInfo(int showId) async{
    Network network = Network("$baseUrl/tv/$showId?api_key=$apiKey&language=en-US&page=1");
    var data = await network.getData();
    return data;
  }

}