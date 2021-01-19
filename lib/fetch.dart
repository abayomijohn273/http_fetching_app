import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'album.dart';

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch data.');
  }
}
