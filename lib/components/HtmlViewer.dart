import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class HtmlViewer extends StatefulWidget {
  final String html;

  HtmlViewer({@required this.html});

  @override
  _HtmlViewerState createState() => _HtmlViewerState();
}

class _HtmlViewerState extends State<HtmlViewer> {
  @override
  Widget build(BuildContext context) {
    return HtmlView(
      data: widget.html,
      onLaunchFail: (url) {
        // optional, type Function
        print("launch $url failed");
      },
      scrollable: true, //false to use MarksownBody and true to use Marksown
    );
  }
}
