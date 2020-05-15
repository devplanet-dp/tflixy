import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflixy/models/show_detail_model.dart';
import 'package:tflixy/widgets/hero.dart';

import '../api.dart';
import '../global.dart';

class DetailScreen extends StatefulWidget{
  final int id;

  const DetailScreen({Key key, this.id}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen>{
  Future<ShowDetail> showDetails;
  @override
  void initState() {
    super.initState();
    showDetails = getShowDetail(widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<ShowDetail>(
          future: showDetails,
          builder: (ctx,snapshot){
            if(snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    MyHero(
                      imageUrl: getPosterImage(snapshot.data.poster_path),
                    )
                  ],
                ),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<ShowDetail> getShowDetail(int id) async {
    var result = await Api().getShowInfo(id);
    var latestMap = json.decode(result);
    print("DATA ${ShowDetail.fromJson(latestMap)}");
    return ShowDetail.fromJson(latestMap);
  }
}