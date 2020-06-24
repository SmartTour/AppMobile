import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/components/HtmlViewer.dart';

class TourViewerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String html = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        body: Container(
            child:HtmlViewer(
            html: html,
          ),
        ),
      ),
    );
  }
}
