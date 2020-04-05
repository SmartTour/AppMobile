import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  final int id;
  final String title;
  final String description;

  ContentScreen(
      @required this.id, @required this.title, @required this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contenuto #$id')),
      body: Container(
        child: Center(
          child: SizedBox(
            height: 500,
            width: 400,
            child: Card(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "$title",
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('$description')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
