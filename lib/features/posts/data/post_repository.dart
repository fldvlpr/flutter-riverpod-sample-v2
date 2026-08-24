import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample_v2/core/network/api_client.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/domain/post.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/domain/post_response.dart';

class PostRepository {
  final ApiClient _apiClient;

  PostRepository(this._apiClient);

  Future<List<Post>> getPosts() async {
    final result = await _apiClient.get('/posts');

    return PostResponse.fromJson(result).posts;
  }

  Future<Post> createPost(String title) async {
    final result = await _apiClient.post('/posts/add', {
      'title': title,
      'userId': 1,
      'completed': false,
    });

    return Post.fromJson(result);
  }

  Future<Post> getPostById(int id) async {
    final result = await _apiClient.get('/posts/$id');

    return Post.fromJson(result);
  }
}

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository(ref.watch(apiClientProvider));
});
