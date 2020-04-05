import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/layout/DefaulLayout.dart';
import 'package:smart_tour_mobile/screens/ContentScreen.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<dynamic> listExploreData;
  List<dynamic> listReal;

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/explore-data.json');
  }

  @override
  void initState() {
    super.initState();
    // ApiService().fetchExploreData().then((value) => setState(() {
    //       listReal = jsonDecode(value.body);
    //       log(listReal.toString());
    //     }));
    loadJson().then((value) => setState(() {
          listExploreData = jsonDecode(value);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        titleAppBar: 'Explore',
        child: Container(
          child: listExploreData == null
              ? Center(
                  child: Text("dati non ancora disponibili"),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: listExploreData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                          'ZONA #${listExploreData[index]['id']}: ${listExploreData[index]['Zone']} '),
                      leading: Icon(Icons.pin_drop),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContentScreen(
                                  listExploreData[index]['id'],
                                  listExploreData[index]['Item']['Title'],
                                  listExploreData[index]['Item']
                                      ['Description'])),
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
        ));
  }
}
