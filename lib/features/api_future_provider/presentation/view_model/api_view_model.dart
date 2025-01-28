import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/api_future_provider/data/repository/post_repository_impl.dart';
import 'package:flutter_riverpod_new/features/api_future_provider/domain/model/post_model.dart';
import 'package:flutter_riverpod_new/features/api_future_provider/domain/repository/post_repository.dart';

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  final PostRepository postRepository = PostRepositoryImpl();

  try {
    return await postRepository.getPosts();
  } on SocketException {
    throw "No Internet";
  } catch (e) {
    rethrow;
  }
});
