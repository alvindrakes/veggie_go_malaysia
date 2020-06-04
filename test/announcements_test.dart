import 'package:flutter_test/flutter_test.dart';
import 'package:veggie_go_malaysia/datamodels/announcement.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/announcements.dart';

import 'widget_wrapper.dart';

void main(){
  // we want to make sure long strings don't crash the display
  group('test for text overflows', (){
    testWidgets('trying large title', (WidgetTester tester) async {
      await tester.pumpWidget(testableWidget(
              child: AnnouncementCarousel([
          Announcement(title: 'A' * 256, previewContent: '', imageUrl: ''),]),
      ));
    });

    testWidgets('trying large preview content', (WidgetTester tester) async {
      await tester.pumpWidget(testableWidget(
              child: AnnouncementCarousel([
          Announcement(title: '', previewContent: 'A' * 512, imageUrl: ''),]),
      ));
    });
  });
  // we want to handle invalid data appropriately
  group('test for null and invalid data', (){
    test('testing null data', (){
      // TODO: not necessary yet on mockservice only when implementing real functions
    });
    test('testing invalid data handling', (){
      // TODO: not necessary yet until mock->real
    });
  });

  // TODO: 
  // we want to make sure smaller screen sizes don't cause overflows
  group('', (){});
}