import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflixy/api.dart';
import 'package:tflixy/models/latest_model.dart';
import 'package:tflixy/models/popular_tv_model.dart';
import 'package:tflixy/util/strings.dart';
import 'package:tflixy/widgets/chip_widget.dart';
import 'package:tflixy/widgets/latest_widget.dart';
import 'package:tflixy/widgets/movie_container_widget.dart';
import 'package:tflixy/widgets/section_container_widget.dart';

import '../models/genre_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<PopularTv>> popularTvShows;
  Future<List<PopularTv>> topRatedShows;
  Future<List<PopularTv>> airingTodayShows;
  Future<List<Genre>> genre;
  Future<Latest> latest;


  @override
  void initState() {
    super.initState();
    popularTvShows = getPopularTvShows();
    genre = getGenres();
    latest = getLatestTvShow();
    topRatedShows = getTopRatedTvShows();
    airingTodayShows = getAiringTodayShows();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
          title: Text(
            mAppTitle,
            style: Theme.of(context).textTheme.headline,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
//              Align(
//                  alignment: Alignment.topLeft,
//                  child: Container(
//                    margin: EdgeInsets.all(10),
//                    child: Text(
//                      mLatestLabel,
//                      style: Theme.of(context).textTheme.title,
//                    ),
//                  )),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: FutureBuilder<Latest>(
                  future: latest,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return LatestWidget(snapshot: snapshot);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.0),
                height: 61,
                child: FutureBuilder<List<Genre>>(
                  future: genre,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MultiSelectChip(snapshot: snapshot,onSelectionChanged: (selectedGenre){
                        setState(() {
                          print("SELECTED GENRE $selectedGenre");
                        });
                      },);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(height: 15,),
              SectionContainer(
                sectionTitle: mPopular,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: FutureBuilder<List<PopularTv>>(
                    future: popularTvShows,
                    builder: (ctx,snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, id) {
                            return MovieContainer(snapshot: snapshot.data[id]);
                          },
                        );
                      }else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              SectionContainer(
                sectionTitle: mTopRated,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: FutureBuilder<List<PopularTv>>(
                    future: topRatedShows,
                    builder: (ctx,snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, id) {
                            return MovieContainer(snapshot: snapshot.data[id]);
                          },
                        );
                      }else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SectionContainer(
                sectionTitle: mAiringToday,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: FutureBuilder<List<PopularTv>>(
                    future: airingTodayShows,
                    builder: (ctx,snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, id) {
                            return MovieContainer(snapshot: snapshot.data[id]);
                          },
                        );
                      }else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<PopularTv>> getPopularTvShows() async {
    var result = await Api().getPopularTvShows();
    var popularTvMap = json.decode(result)['results'];
    return PopularTvList.fromJson(popularTvMap).tvList;
  }

  Future<List<PopularTv>> getTopRatedTvShows() async {
    var result = await Api().getTopRatedTV();
    var popularTvMap = json.decode(result)['results'];
    return PopularTvList.fromJson(popularTvMap).tvList;
  }

  Future<List<PopularTv>> getAiringTodayShows() async {
    var result = await Api().getAiringToday();
    var popularTvMap = json.decode(result)['results'];
    return PopularTvList.fromJson(popularTvMap).tvList;
  }

  Future<List<Genre>> getGenres() async {
    var result = await Api().getGenres();
    var genreMap = json.decode(result)['genres'];
    return GenreList.fromJson(genreMap).genreList;
  }

  Future<Latest> getLatestTvShow() async {
    var result = await Api().getLatestTV();
    var latestMap = json.decode(result);
    return Latest.fromJson(latestMap);
  }
}
