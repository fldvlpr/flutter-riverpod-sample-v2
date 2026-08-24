import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/presentation/providers/post_providers.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: state.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];

            return Card(
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey),
              ),
              child: ListTile(
                title: Text(post.title),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                ),
                onTap: () {
                  context.push('/posts/${post.id}');
                },
              ),
            );
          },
        ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: const CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
