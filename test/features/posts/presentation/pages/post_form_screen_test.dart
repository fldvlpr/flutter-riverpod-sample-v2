import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/data/post_repository.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/domain/post.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/presentation/pages/post_form_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockPostRepository mockRepository;

  setUp(() {
    mockRepository = MockPostRepository();
  });

  Widget createWidgetUnderTest() {
    // 1. Create a mini GoRouter just for this test
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PostFormScreen()),
      ],
    );
    return ProviderScope(
      overrides: [postRepositoryProvider.overrideWithValue(mockRepository)],
      // 2. Use MaterialApp.router so context.pop() works!
      child: MaterialApp.router(routerConfig: router),
    );
  }

  testWidgets('PostFormScreen shows validation error when input is empty', (
    tester,
  ) async {
    // 1. Arrange
    final fakePosts = <Post>[];
    when(() => mockRepository.getPosts()).thenAnswer((_) async => fakePosts);

    // 2. Act (Render the widget)
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // 3. Act (Tap the Create button WITHOUT entering any text!)
    await tester.tap(find.byType(ElevatedButton));

    // We only use .pump() here instead of pumpAndSettle() because we just
    // want to trigger the UI to rebuild and show the red error text.
    await tester.pump();

    // 4. Assert
    // The test runner will literally look at the screen for this red error text!
    expect(find.text('Please enter a title'), findsOneWidget);

    // We verify that the createPost method on the repository was NEVER called!
    verifyNever(() => mockRepository.createPost(any()));
  });

  testWidgets('PostFormScreen adds post on button press', (tester) async {
    // 1. Arrange
    final fakePosts = <Post>[]; // Initial list is empty
    final newPost = Post(id: 1, userId: 1, title: 'New Post', completed: false);

    // The provider will initialize first, so we mock getPosts
    when(() => mockRepository.getPosts()).thenAnswer((_) async => fakePosts);
    // Then we mock the actual creation call
    when(
      () => mockRepository.createPost('New Post'),
    ).thenAnswer((_) async => newPost);

    // 2. Act (Render)
    await tester.pumpWidget(createWidgetUnderTest());

    // Wait for the provider's initial load to finish
    await tester.pumpAndSettle();

    // 3. Act (Simulate User Input)
    // The Magic: We tell the test runner to type text into our TextField!
    await tester.enterText(find.byType(TextFormField), 'New Post');

    // Tell the test runner to tap the Create button!
    await tester.tap(find.byType(ElevatedButton));

    // Allow the async addToPost method to finish running
    await tester.pumpAndSettle();

    // 4. Assert
    // We verify the repository method was actually called with the text we typed!
    verify(() => mockRepository.createPost('New Post')).called(1);
  });
}
