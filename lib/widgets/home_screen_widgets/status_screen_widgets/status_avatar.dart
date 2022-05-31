import 'dart:math';
import 'package:flutter/material.dart';

class StatusAvatar extends CustomPainter {
  //number of stories
  final int numberOfStories;
  //start of the arc painting in degree(0-360)
  double startOfArcInDegree;

  final int numberOfSeenStories;

  final Color unseenColor;
  final Color seenColor;

  StatusAvatar({
    required this.numberOfStories,
    required this.numberOfSeenStories,
    required this.seenColor,
    required this.unseenColor,
    this.startOfArcInDegree = 90,
  });

  //drawArc deals with rads, easier for me to use degrees
  //so this takes a degree and change it to rad
  double inRads(double degree) {
    return (-degree * pi) / 180;
  }

  @override
  bool shouldRepaint(StatusAvatar oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //circle angle is 360, remove all space arcs between the main story arc (the number of spaces(stories) times the  space length
    //then subtract the number from 360 to get ALL arcs length
    //then divide the ALL arcs length by number of Arc (number of stories) to get the exact length of one arc
    int spaceLength = numberOfStories < 2
        ? 0
        : (numberOfStories < 10
            ? 10
            : (numberOfStories < 20
                ? 8
                : (numberOfStories < 35
                    ? 6
                    : (numberOfStories <= 60 ? 5 : 1))));

    double arcLength =
        (360 - (numberOfStories * spaceLength)) / numberOfStories;

    //be careful here when arc is a negative number
    //that happens when the number of spaces is more than 360
    //feel free to use what logic you want to take care of that
    //note that numberOfStories should be limited too here
    if (arcLength <= 0) {
      arcLength = 1;
    }

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    //looping for number of stories to draw every story arc
    for (int i = 0; i < numberOfStories; i++) {
      Color statusColor = i < numberOfSeenStories ? seenColor : unseenColor;
      //printing the arc
      canvas.drawArc(
        rect,
        inRads(startOfArcInDegree),
        //be careful here is:  "double sweepAngle", not "end"
        inRads(arcLength),
        false,
        Paint()
          //here you can compare your SEEN story index with the arc index to make it grey
          ..color = statusColor
          ..strokeWidth = 2.0
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,
      );

      //the logic of spaces between the arcs is to start the next arc after jumping the length of space
      startOfArcInDegree += arcLength + spaceLength;
    }
  }
}
