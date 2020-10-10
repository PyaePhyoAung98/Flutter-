import 'package:flutter/material.dart';

import 'album.dart';

class AlbumCell extends StatelessWidget {
  const AlbumCell(this.context, this.album);
  final Album album;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                  child: Image.network(
                album.thumbnailUrl,
                width: 150,
                height: 150,
              )),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  album.title,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
