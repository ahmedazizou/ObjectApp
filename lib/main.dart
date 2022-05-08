import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/realtime/live_camera.dart';
import 'package:object_detection/staticimage/static.dart';

import 'Api/splashScreen.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // running the app
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Object Detector App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: aboutDialog,
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 170,
                child: ElevatedButton(
                  child: Text("Detect in Image"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaticImage(),
                      ),
                    );
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 160,
                child: ElevatedButton(
                  child: Text("Real Time Detection"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LiveFeed(cameras),
                      ),
                    );
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 160,
                child: ElevatedButton(
                  child: Text("Using API"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  aboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: "Object Detector App",
      applicationLegalese: "By Ahmed Azizou",
      applicationVersion: "1.0",
      children: <Widget>[
        Text("www.vumobjectapp.com"),
      ],
    );
  }
}
