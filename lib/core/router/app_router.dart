import 'package:flutter_riverpod_sample_v2/features/posts/presentation/pages/home_screen.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/presentation/pages/post_detail_screen.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/presentation/pages/post_form_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(path: '/', redirect: (context, state) => '/posts'),

    GoRoute(
      path: '/posts',
      name: 'posts',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/create',
      name: 'create-post',
      builder: (context, state) => PostFormScreen(),
    ),

    GoRoute(
      path: '/posts/:id',
      name: 'post-detail',
      builder: (context, state) =>
          PostDetailScreen(postId: int.parse(state.pathParameters['id']!)),
    ),
  ],
);
