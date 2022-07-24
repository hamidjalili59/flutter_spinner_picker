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
  final TextStyle? style;
  final double? fontSize;
  final Color? selectedFontColor;
  final Color? unselectedFontColor;
  final double padding;
  final Color? color;
  // final bool is12HourMode;
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
      this.style,
      // this.is12HourMode = false,
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
                  // itemCount: widget.is12HourMode ? 12 : 24,
                  itemCount: 24,
                  scrollDirection: Axis.vertical,
                  controller: PageController(
                      viewportFraction: 0.3, initialPage: _indexLeft),
                  onPageChanged: (int index) => setState(() {
                    // if (widget.is12HourMode) {
                    // _indexLeft = index * 2;
                    // } else {
                    _indexLeft = index;
                    // }
                    setState(() {
                      if (widget.onTimeChange != null) {
                        widget.onTimeChange!(getDateTime());
                      }
                    });
                  }),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _indexLeft ? 1.3 : 0.7,
                      child: SizedBox(
                          width: widget.itemWidth,
                          height: widget.itemHeight,
                          child: Center(
                            child: Text(
                              i.toString().padLeft(2, "0"),
                              style: TextStyle(
                                  color: i == _indexLeft
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
                  itemCount: 60,
                  scrollDirection: Axis.vertical,
                  controller: PageController(
                      viewportFraction: 0.3, initialPage: _indexRight),
                  onPageChanged: (int index) => setState(() {
                    _indexRight = index;
                    setState(() {
                      if (widget.onTimeChange != null) {
                        widget.onTimeChange!(getDateTime());
                      }
                    });
                  }),
                  itemBuilder: (_, iR) {
                    return Transform.scale(
                      scale: iR == _indexRight ? 1.3 : 0.7,
                      child: SizedBox(
                          width: widget.itemWidth,
                          height: widget.itemHeight,
                          child: Center(
                            child: Text(
                              iR.toString().padLeft(2, "0"),
                              style: TextStyle(
                                  color: iR == _indexRight
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
