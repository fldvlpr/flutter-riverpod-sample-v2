import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/data/post_repository.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/domain/post.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/presentation/pages/post_detail_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [postRepositoryProvider.overrideWithValue(mockPostRepository)],
      child: MaterialApp(home: PostDetailScreen(postId: 1)),
    );
  }

  group('Post Detail Screen Test', () {
    testWidgets('should show loader and then display data', (tester) async {
      final fakePost = Post(
        id: 1,
        userId: 1,
        title: 'Buy groceries',
        completed: false,
      );

      when(
        () => mockPostRepository.getPostById(1),
      ).thenAnswer((_) async => fakePost);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Title: Buy groceries'), findsOneWidget);
    });
  });
}
