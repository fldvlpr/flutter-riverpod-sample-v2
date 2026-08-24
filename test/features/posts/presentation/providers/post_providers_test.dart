import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/data/post_repository.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/domain/post.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/presentation/providers/post_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements PostRepository {}

void main() {
  late MockRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockRepository();

    // We create a ProviderContainer and override the repository provider!
    // Now, our Notifier will automatically use the mock when it calls ref.watch!
    container = ProviderContainer(
      overrides: [postRepositoryProvider.overrideWithValue(mockRepository)],
    );
  });

  // tearDown runs after every test to clean up memory
  tearDown(() {
    container.dispose();
  });

  group(('Post List Notifier'), () {
    test('initial state loads posts', () async {
      final fakePosts = [
        Post(id: 1, userId: 1, title: 'Test 1', completed: false),
      ];
      when(() => mockRepository.getPosts()).thenAnswer((_) async => fakePosts);

      // We read the '.future' of the provider to wait for it to finish its initial build() loading!
      final posts = await container.read(postListProvider.future);

      expect(posts.length, 1);
      expect(posts.first.title, 'Test 1');
      verify(() => mockRepository.getPosts()).called(1);
    });

    test('add todo appends a new todo to the list', () async {
      final postInput = 'New Todo';
      final initPosts = [
        Post(id: 1, userId: 1, title: 'Test 1', completed: false),
      ];
      final newPost = Post(
        id: 2,
        userId: 1,
        title: postInput,
        completed: false,
      );
      when(() => mockRepository.getPosts()).thenAnswer((_) async => initPosts);
      when(
        () => mockRepository.createPost(postInput),
      ).thenAnswer((_) async => newPost);

      // We read the '.future' of the provider to wait for it to finish its initial build() loading!
      final posts = await container.read(postListProvider.future);
      expect(posts.length, 1);
      expect(posts.first.title, 'Test 1');
      verify(() => mockRepository.getPosts()).called(1);

      await container.read(postListProvider.notifier).addPost(postInput);

      final updatedPosts = container.read(postListProvider).value!;
      expect(updatedPosts.length, 2);
      expect(updatedPosts.last.title, postInput);
      verify(() => mockRepository.createPost(postInput)).called(1);
    });
  });

  group(('Post Detail Notifier'), () {
    test('fetch a single post by id', () async {
      final fakePost = Post(
        id: 1,
        userId: 1,
        title: 'Test 1',
        completed: false,
      );

      when(
        () => mockRepository.getPostById(1),
      ).thenAnswer((_) async => fakePost);

      // We read the '.future' of the provider to wait for it to finish its initial build() loading!
      final post = await container.read(postDetailProvider(1).future);

      expect(post.id, 1);
      expect(post.title, 'Test 1');
      verify(() => mockRepository.getPostById(1)).called(1);
    });
  });
}
