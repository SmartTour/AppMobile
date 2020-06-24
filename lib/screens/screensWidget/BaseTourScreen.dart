import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/components/HtmlViewer.dart';
import 'package:smart_tour_mobile/models/BaseTourZoneModel.dart';

class BaseTourScreen extends StatefulWidget {
  @override
  _BaseTourScreenState createState() => _BaseTourScreenState();
}

class _BaseTourScreenState extends State<BaseTourScreen> {
  @override
  Widget build(BuildContext context) {
    final List<BaseTourZoneModel> list = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            itemCount: list.length,
            itemBuilder: (context, positoned) {
              return HtmlViewer(html: list[positoned].content.contentHtml);
            }),
      ),
    );
  }
}
