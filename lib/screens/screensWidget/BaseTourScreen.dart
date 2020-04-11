import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/components/HtmlViewer.dart';
import 'package:smart_tour_mobile/models/ContentModel.dart';

class BaseTourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ContentModel> list = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            itemCount: list.length,
            itemBuilder: (context, positoned) {
              return HtmlViewer(html: list[positoned].htmlContent);
            }),
      ),
    );
  }
}
