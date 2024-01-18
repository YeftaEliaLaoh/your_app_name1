import 'package:flutter/material.dart';
import 'package:theme_patrol/theme_patrol.dart';
import 'package:task/form/main.dart';
/*
Author Name  :  WeblineIndia  |  https://www.weblineindia.com/
For more such software development components and code libraries, visit us at
https://www.weblineindia.com/software-development-resources.html 
Our Github URL : https://github.com/weblineindia
*/

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({super.key});
  static String id = '/Home';

  @override
  Widget build(BuildContext context) {
    return ThemePatrol(
      light: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      builder: (context, theme) {
        return MaterialApp(
          title: 'Choice',
          theme: theme.lightData,
          darkTheme: theme.darkData,
          themeMode: theme.mode,
          home: const MyHomePage(
            title: 'Flutter Choice',
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 355,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  text:
                      'A successor to smart_select and chips_choice with cleaner, more flexible, and composable API for creating inline or prompted single or multiple choice widgets.',
                ),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: 300,
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: (1 / .4),
                ),
                children: [
                  MenuButton(
                    label: 'Form',
                    builder: (_) => const FormChoicePage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.label,
    required this.builder,
  });

  final String label;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: builder),
          );
        },
        child: Text(label),
      ),
    );
  }
}
