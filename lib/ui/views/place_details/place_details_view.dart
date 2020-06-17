import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';

class PlaceDetailsView extends StatelessWidget {
  final Place place;
  PlaceDetailsView(this.place);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // temp appbar, will probably changed to SliverAppbar
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Hero(
            tag: place.documentID,
            child: CachedNetworkImage(
              imageUrl: place.mainPhoto,
              imageBuilder: (context, imageProvider) => Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
