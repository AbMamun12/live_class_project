import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery
    MediaQueryData mediaQuery = MediaQuery.of(context);
    print(mediaQuery.size.width);
    print(mediaQuery.size.height);
    print(mediaQuery.size.aspectRatio);
    print(mediaQuery.size.flipped.height);

    print(mediaQuery.devicePixelRatio);

    if (mediaQuery.size.width < 640) {
      print('This is a Phone');
    } else if (mediaQuery.size.width > 640 && mediaQuery.size.width < 1008) {
      print('This is a Tablet');
    } else {
      print('Laptop/Dextop');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.cyan,
      ),
      /*  body: OrientationBuilder(
        builder: (context, Orientation orientation) {
          print(orientation);
          if (orientation == Orientation.portrait){
            return Column(
            children: [
              Wrap(
                // mainAxisAlignment
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 15,
                children: [
                  Text('fghmgmj'),
                  Text('fggfngfdfdfdfdfdfdfdfdfdfdfdhmgmj'),
                  Text('fghghnfdvvvvvvvvvvvvvdghmgmj'),
                  Text('fghmggavvvvvvhnsfdghmj'),

                ],
              ),
            ],
          );
          } else {
            return Center(
              child: Text('Too Big Screen'),
            );
          }
        }
      ), */
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints0) {
          if (mediaQuery.size.width < 640) {
            return Text('This is a Phone');
          } else if (mediaQuery.size.width > 640 &&
              mediaQuery.size.width < 1008) {
            return Text('This is a Tablet');
          } else {
            return Text('Laptop/Dextop');
          }
        },
      ),
    );
  }
}
