<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Date Picker with spinner instead of a default material time picker. This widget works with 12 or 24 hour format and custom interval mode.

## Features

give DateTime format in FlutterSpinner Method.

## Getting started

adding lastest version in your pabspect and pub get

## Usage

import package and enjoy it

```dart
 FlutterSpinner(
                color: Colors.grey,
                fontSize: 26,
                is24Hour: false,
                selectedFontColor: Colors.white,
                unselectedFontColor: Colors.white.withOpacity(0.4),
                height: 310,
                width: 200,
                itemHeight: 10,
                itemWidth: 50,
                padding: 20,
                selectedDate: DateTime.now(),
                onTimeChange: (date) {
                  setState(() {
                    selectedTime = date;
                  });
                },
                spacing: 10,
              ),
```

## Additional information

if this package have a problem , issue it
