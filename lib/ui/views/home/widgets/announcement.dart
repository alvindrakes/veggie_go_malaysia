import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:veggie_go_malaysia/datamodels/announcement.dart';

class AnnouncementCarousel extends StatelessWidget {
  final List<Announcement> announcements;
  AnnouncementCarousel(this.announcements);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: announcements.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        var item = announcements[itemIndex];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    color: Colors.grey[200],
                    offset: Offset(0, 2))
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: <Widget>[
                          Text(
                            item.title,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            item.previewContent,
                            style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: CachedNetworkImage(imageUrl: item.imageUrl),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 130,
        viewportFraction: 1,
        autoPlay: true,
        enableInfiniteScroll: false,
        autoPlayInterval: Duration(seconds: 10),
        autoPlayAnimationDuration: Duration(milliseconds: 500),
        enlargeCenterPage: true,
        reverse: false,
      ),
    );
  }
}
