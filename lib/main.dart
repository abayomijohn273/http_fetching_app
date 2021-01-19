import 'dart:async';

import 'package:flutter/material.dart';

import 'album.dart';
import 'fetch.dart' as fetch;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetching Data from an api',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data'),
        ),
        body: DataFetcher(),
      ),
    );
  }
}

class DataFetcher extends StatefulWidget {
  @override
  _DataFetcherState createState() => _DataFetcherState();
}

class _DataFetcherState extends State<DataFetcher> {
  Future<Album> fetchAlbum;
  @override
  void initState() {
    super.initState();
    fetchAlbum = fetch.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: fetchAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Text(snapshot.data.title);
          } else if (snapshot.hasError) {
            Text(snapshot.error);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
