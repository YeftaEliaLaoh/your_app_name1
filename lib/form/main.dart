import 'package:flutter/material.dart';
import 'package:task/layout.dart';
import 'package:task/sample.dart';
import 'inline.dart';
import 'prompt.dart';

class FormChoicePage extends StatelessWidget {
  const FormChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageLayout(
      title: 'Form and FormField',
      children: <Widget>[
        SamplePanel(
          title: 'Inline Choice Form',
          source: 'form/inline.dart',
          child: FormInline(),
        ),
        SamplePanel(
          title: 'Prompted Choice Form',
          source: 'form/prompt.dart',
          child: FormPrompt(),
        ),
      ],
    );
  }
}
