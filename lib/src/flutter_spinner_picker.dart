import 'package:flutter/material.dart';

int _indexLeft = 0;
int _indexRight = 0;

typedef TimePickerCallback = void Function(DateTime);

class FlutterSpinner extends StatefulWidget {
  final DateTime selectedDate;
  final double? spacing;
  final double? width;
  final double? height;
  final double itemHeight;
  final double itemWidth;
  final double? fontSize;
  final Color? selectedFontColor;
  final Color? unselectedFontColor;
  final double padding;
  final Color? color;
  final TimePickerCallback? onTimeChange;

  const FlutterSpinner(
      {this.color,
      required this.selectedDate,
      required this.height,
      required this.width,
      this.itemHeight = 20,
      this.itemWidth = 20,
      this.padding = 8,
      this.spacing,
      this.unselectedFontColor = Colors.white,
      this.selectedFontColor = Colors.white38,
      this.fontSize = 16,
      this.onTimeChange,
      Key? key})
      : super(key: key);

  @override
  State<FlutterSpinner> createState() => _FlutterSpinnerState();
}

class _FlutterSpinnerState extends State<FlutterSpinner> {
  DateTime currentTime = DateTime.now();
  //getter
  DateTime getDateTime() {
    int hour = _indexLeft;
    int minute = _indexRight;
    return DateTime(
        currentTime.year, currentTime.month, currentTime.day, hour, minute);
  }

//
  @override
  void initState() {
    super.initState();
    setState(() {
      _indexLeft = widget.selectedDate.hour;
      _indexRight = widget.selectedDate.minute;
    });
    if (widget.onTimeChange != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => widget.onTimeChange!(getDateTime()));
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.color,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.width! / 2.5,
              height: widget.height,
              child: SizedBox(
                height: widget.itemHeight, // card height
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: PageController(
                      viewportFraction: 0.3,
                      initialPage: _indexLeft,
                      keepPage: true),
                  pageSnapping: true,
                  onPageChanged: (int index) => setState(() {
                    int saeat;
                    saeat = index ~/ 24;
                    _indexLeft = index - saeat * 24;
                    if (widget.onTimeChange != null) {
                      widget.onTimeChange!(getDateTime());
                    }
                  }),
                  itemBuilder: (_, i) {
                    int saeat;
                    saeat = i ~/ 24;
                    return Transform.scale(
                      scale: i - saeat * 24 == _indexLeft ? 1.3 : 0.7,
                      child: SizedBox(
                          width: widget.itemWidth,
                          height: widget.itemHeight,
                          child: Center(
                            child: Text(
                              (i - saeat * 24).toString().padLeft(2, "0"),
                              style: TextStyle(
                                  color: i - saeat * 24 == _indexLeft
                                      ? widget.selectedFontColor
                                      : widget.unselectedFontColor,
                                  fontSize: widget.fontSize),
                            ),
                          )),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: widget.spacing,
            ),
            SizedBox(
              width: widget.width! / 2.5,
              height: widget.height,
              child: SizedBox(
                height: widget.itemHeight, // card height
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: PageController(
                      viewportFraction: 0.3, initialPage: _indexRight),
                  onPageChanged: (int index) => setState(() {
                    int daghighe;
                    daghighe = index ~/ 60;
                    _indexRight = index - daghighe * 60;
                    setState(() {
                      if (widget.onTimeChange != null) {
                        widget.onTimeChange!(getDateTime());
                      }
                    });
                  }),
                  itemBuilder: (_, iR) {
                    int daghighe;
                    daghighe = iR ~/ 60;
                    return Transform.scale(
                      scale: iR - daghighe * 60 == _indexRight ? 1.3 : 0.7,
                      child: SizedBox(
                          width: widget.itemWidth,
                          height: widget.itemHeight,
                          child: Center(
                            child: Text(
                              (iR - daghighe * 60).toString().padLeft(2, "0"),
                              style: TextStyle(
                                  color: iR - daghighe * 60 == _indexRight
                                      ? widget.selectedFontColor
                                      : widget.unselectedFontColor,
                                  fontSize: widget.fontSize),
                            ),
                          )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
