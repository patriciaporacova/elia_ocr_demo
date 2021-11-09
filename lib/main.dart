import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr_demo_firebase_ml/speech_recognition/speech_recognition_widget.dart';
import 'package:ocr_demo_firebase_ml/text_recognition/text_recognition_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Demo';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TextRecognitionWidget()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text('Text'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  ),
                ),
              ),
              
              const SizedBox(height: 25),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpeechRecognitionWidget()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text('Speech'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 18.0),),
                ),
              ),
            ],
          ),
        ),
      );
}
