import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veggie_go_malaysia/ui/shared_widgets/list_item.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => ListItem(index: index),
          )),
    );
  }
}

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 5,
          children: <Widget>[
            Container(color: Colors.black),
            Container(color: Colors.black),
            Container(color: Colors.black),
            Container(color: Colors.black),
            Container(color: Colors.black),
          ],
        ),
      ),
    );
  }
}
