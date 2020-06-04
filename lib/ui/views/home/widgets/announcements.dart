import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggie_go_malaysia/datamodels/announcement.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey[200], offset: Offset(0, 2))],
            ),
            child: Padding(
              padding: EdgeInsets.all(40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                          children: <Widget>[
                            Expanded(child: Text(item.title, style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w500, fontSize: 20,), overflow: TextOverflow.clip,)),
                            SizedBox(height: 25.h,),
                            Expanded(child: Text(item.previewContent, overflow: TextOverflow.clip,)),
                          ],
                        ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
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
        height: 600.h,
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