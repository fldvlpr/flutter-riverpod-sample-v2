import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/data/post_repository.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/domain/post.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/presentation/pages/home_screen.dart';
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
      child: MaterialApp(home: HomeScreen()),
    );
  }

  group('Home Screen Test', () {
    testWidgets('should show loader initially and then show list of posts', (
      tester,
    ) async {
      final fakePosts = [
        Post(id: 1, userId: 1, title: 'Buy groceries', completed: false),
        Post(id: 2, userId: 1, title: 'Walk the dog', completed: true),
      ];

      when(
        () => mockPostRepository.getPosts(),
      ).thenAnswer((_) async => fakePosts);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Buy groceries'), findsOneWidget);
      expect(find.text('Walk the dog'), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(2));
    });
  });
}
