import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/data/post_repository.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/domain/post.dart';

class PostListNotifier extends AsyncNotifier<List<Post>> {
  @override
  FutureOr<List<Post>> build() {
    final repository = ref.read(postRepositoryProvider);

    return repository.getPosts();
  }

  Future<void> addPost(String title) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final repository = ref.read(postRepositoryProvider);
      final post = await repository.createPost(title);

      return [...?state.value, post];
    });
  }
}

final postListProvider = AsyncNotifierProvider<PostListNotifier, List<Post>>(
  () => PostListNotifier(),
);

final postDetailProvider = FutureProvider.family<Post, int>((ref, id) async {
  return ref.watch(postRepositoryProvider).getPostById(id);
});
