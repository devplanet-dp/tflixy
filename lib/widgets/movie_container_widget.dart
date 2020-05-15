import 'package:flutter/material.dart';
import 'package:tflixy/global.dart';
import 'package:tflixy/models/popular_tv_model.dart';
import 'package:tflixy/screens/detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieContainer extends StatelessWidget{
  final PopularTv snapshot;

  const MovieContainer({
    Key key,
    this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => DetailScreen(id: snapshot.id),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0, color: Colors.grey[400], offset: Offset(0, 3))
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage.memoryNetwork(
                  image: getPosterImage(snapshot.poster_path),
                  placeholder: kTransparentImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.black45,
                ),
                child: Text(
                  snapshot.original_name,
                  style: Theme.of(context).textTheme.display1,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}