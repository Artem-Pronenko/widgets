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

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
              Text('some text'),
            ],
          ),
        ),
      ),
    );
  }
}
