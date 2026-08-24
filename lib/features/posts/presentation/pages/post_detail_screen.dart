import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/presentation/providers/post_providers.dart';

class PostDetailScreen extends ConsumerWidget {
  final int postId;

  const PostDetailScreen({required this.postId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailProvider(postId));

    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail')),
      body: state.when(
        data: (post) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ID: ${post.id}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Text(
                  'Title: ${post.title}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text('Completed: ${post.completed}'),
              ],
            ),
          );
        },
        error: (error, stack) => Center(child: Text('Error: $error')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
