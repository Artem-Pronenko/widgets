import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// почему MaterialApp flutter_platform_widgets Platform.is<IOS, Android, Windows, ....>
// MaterialApp
/*
home
initialRoute
debugShowCheckedModeBanner
theme
locale
supportedLocales
localizationsDelegates
localeResolutionCallback
navigatorKey
builder
routes
onGenerateRoute
 */
// Scaffold
// SafeArea
// Text

// #2
// Text
// RichText Text.rich TextSpan
// SelectableText

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {'/': (context) => const App()},
    );
  }
}

class RedBox extends StatelessWidget {
  const RedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      color: Colors.red,
    );
  }
}

class GreenBox extends StatelessWidget {
  const GreenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      color: Colors.green,
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Center(
              child: Text(
                'Row ------------------------------------>',
                style: TextStyle(fontSize: 22),
              ),
            ),
            const Center(
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Column ------------------------------------>',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                  ),
                );
              },
            ),
            const ColRowExample(),
          ],
        ),
      ),
    );
  }
}

class ColRowExample extends StatelessWidget {
  const ColRowExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.up,
      mainAxisSize: MainAxisSize.min,
      children: [
        RedBox(),
        GreenBox(),
      ],
    );
  }
}
