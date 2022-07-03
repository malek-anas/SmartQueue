import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:smartqueue/Models/post.dart';


class DataService
{
  final _baseurl = 'https://jsonplaceholder.typicode.com/';

  Future <List<Post>> getPosts() async {
    try {
      // final uri = Uri.https(_baseurl, 'posts');
      final response = await http.get(Uri.parse(_baseurl+ 'posts'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final posts = json.map((e) => Post.fromJson(e)).toList();
        return posts;
      } else{
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      rethrow;
    }
  }


}