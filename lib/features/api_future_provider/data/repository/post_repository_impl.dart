import 'package:flutter_riverpod_new/features/api_future_provider/data/data_source/posts_data_source.dart';
import 'package:flutter_riverpod_new/features/api_future_provider/domain/model/post_model.dart';
import 'package:flutter_riverpod_new/features/api_future_provider/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostsDataSource postsDataSource = PostsDataSource();

  @override
  Future<List<PostModel>> getPosts() {
    try {
      return postsDataSource.fetchPosts();
    } catch (e) {
      rethrow;
    }
  }
}
