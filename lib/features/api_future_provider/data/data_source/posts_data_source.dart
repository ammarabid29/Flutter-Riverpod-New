import 'dart:convert';

import 'package:flutter_riverpod_new/features/api_future_provider/domain/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostsDataSource {
  Future<List<PostModel>> fetchPosts() async {
    final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<PostModel> posts =
            jsonList.map((json) => PostModel.fromJson(json)).toList();
        return posts;
      } else {
        throw Exception('Error fetching posts');
      }
    } catch (e) {
      rethrow;
    }
  }
}
