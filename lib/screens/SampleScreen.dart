import 'package:flutter/material.dart';
import 'package:smart_tour_mobile/layout/DefaulLayout.dart';
import 'package:smart_tour_mobile/screens/ContentScreen.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class SampleScreen extends StatefulWidget {
  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  List<dynamic> listSampleData;
  List<dynamic> listReal;

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/sample-data.json');
  }

  @override
  void initState() {
    super.initState();
    // ApiService().fetchSampleData().then((value) => setState(() {
    //       listReal = jsonDecode(value.body);
    //       log(listReal.toString());
    //     }));
    loadJson().then((value) => setState(() {
          listSampleData = jsonDecode(value);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        titleAppBar: 'Sample',
        child: Container(
          child: listSampleData == null
              ? Center(
                  child: Text("dati non ancora disponibili"),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: listSampleData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                          'ZONA #${listSampleData[index]['id']}: ${listSampleData[index]['Zone']} '),
                      leading: Icon(Icons.pin_drop),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContentScreen(
                                  listSampleData[index]['id'],
                                  listSampleData[index]['Item']['Title'],
                                  listSampleData[index]['Item']
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
