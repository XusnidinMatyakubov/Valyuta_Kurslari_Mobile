import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

const String _markdownSrc = '''
# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted
 Dart code in your app.
## Styling
Style text as _italic_, __bold__, or `inline code`.
- Use bulleted lists
- To better clarify
- Your points
## Links
You can use [hyperlinks](https://flutter.dev) in markdown
## Images
You can include images:
![Flutter logo](https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png)
## Markdown widget
This is an example of how to create your own Markdown widget:
`new Markdown(data: 'Hello _world_!');`
## Code blocks
Formatted Dart code looks really pretty too:
```dart
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)body: new Markdown(data: markdownData)body: new Markdown(data: markdownData)body: new Markdown(data: markdownData)
    )
  ));
}
```
## Tables: 
| foo | bar |
| --- | --- |
| baz | bim |
Enjoy!
''';

class MarkdownExample extends StatelessWidget {
  const MarkdownExample({super.key});

  static Future<void> onTapLink(
      String text, String? href, String title, BuildContext context) async {
    if (href == null) return;
    final _url = Uri.parse(href);
    if (await canLaunchUrl(_url)) {
      launchUrl(_url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wrong address: $href'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Markdown(
        data: _markdownSrc,
        onTapLink: (text, href, title) => onTapLink(text, href, title, context),
        selectable: true,
        extensionSet: md.ExtensionSet(
          /*blockSyntaxes=*/ md.ExtensionSet.gitHubFlavored.blockSyntaxes,
          /*inlineSyntaxes=*/ md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
        ),
      ),
    );
  }
}