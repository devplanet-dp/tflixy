import 'package:flutter/material.dart';
import 'package:tflixy/global.dart';
import 'package:tflixy/models/popular_tv_model.dart';
import 'package:transparent_image/transparent_image.dart';

class PopularTvWidget extends StatelessWidget {
  final AsyncSnapshot<List<PopularTv>> snapshot;
  const PopularTvWidget({
    Key key,
    this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
        itemCount: snapshot.data.length >= 10 ? 10 : snapshot.data.length,
        itemBuilder: (ctx, id) {
          return Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    color: Colors.grey[400],
                    offset: Offset(0, 3))
              ],
            ),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInImage.memoryNetwork(
                      image: getPosterImage(snapshot.data[id].poster_path),
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
                      "${snapshot.data[id].original_name}",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          );
        });



  }

}
