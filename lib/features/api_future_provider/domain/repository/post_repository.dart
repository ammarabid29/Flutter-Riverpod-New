import 'package:flutter_riverpod_new/features/api_future_provider/domain/model/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
