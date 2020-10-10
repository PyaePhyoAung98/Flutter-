import 'dart:convert';
import 'package:gridview_demo/album.dart';
import 'album.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<Album>> getPhotos() async {
    try {
      final response =
          await http.get("https://jsonplaceholder.typicode.com/photos");
      if (response.statusCode == 200) {
        List<Album> list = parsePhotos(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Parse the json response and return list of album object...

  static List<Album> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}
