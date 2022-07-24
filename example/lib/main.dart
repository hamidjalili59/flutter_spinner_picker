import 'package:flutter/material.dart';
import 'package:flutter_spinner_picker/flutter_spinner_picker.dart';

DateTime selectedTime = DateTime(1, 1, 1, 1);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Time picker spinner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterSpinner(
                color: Colors.grey,
                height: 309,
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
                is12HourMode: true,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(selectedTime.toString())
            ],
          ),
        ),
      ),
    );
  }
}
