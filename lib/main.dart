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

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextExamples(),
              const SizedBox(height: 10),
              const Text(
                'Some text Some text Some text Some text Some text Some text Some text Some text  Some text Some text Some text Some text  Some text Some text Some text Some text ',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SelectableText(
                'Some Selectable text',
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Rich'),
                    TextSpan(
                      text: 'Text',
                      style: const TextStyle(fontSize: 22),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('111');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextExamples extends StatelessWidget {
  const TextExamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        const Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        const SelectableText.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Selectable '),
              TextSpan(text: 'Text'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Rich '),
              const TextSpan(
                text: 'bold underline',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' Text!',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print(111);
                  },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2),
      ],
    );
  }
}
