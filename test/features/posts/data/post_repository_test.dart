import 'package:flutter_riverpod_sample_v2/core/network/api_client.dart';
import 'package:flutter_riverpod_sample_v2/features/posts/data/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient mockApiClient;
  late PostRepository postRepository;

  setUp(() {
    mockApiClient = MockApiClient();
    postRepository = PostRepository(mockApiClient);
  });

  group('getPosts', () {
    test('should return a list of posts on success state', () async {
      when(() => mockApiClient.get(any())).thenAnswer(
        (_) async => {
          "posts": [
            {"id": 1, "title": "Test", "completed": false, "userId": 1},
          ],
        },
      );

      final result = await postRepository.getPosts();

      expect(result, isNotEmpty);
      expect(result[0].id, 1);
      expect(result[0].title, 'Test');
    });

    test('should throw error on failure state', () async {
      when(() => mockApiClient.get(any())).thenThrow(Exception('error'));

      expect(() => postRepository.getPosts(), throwsA(isA<Exception>()));
    });
  });

  group('createPost', () {
    test('should return a post on success state', () async {
      when(() => mockApiClient.post(any(), any())).thenAnswer(
        (_) async => {
          "id": 1,
          "title": "Test",
          "completed": false,
          "userId": 1,
        },
      );

      final result = await postRepository.createPost('Test');

      expect(result.id, 1);
      expect(result.title, 'Test');
    });

    test('should throw error on failure state', () async {
      when(
        () => mockApiClient.post(any(), any()),
      ).thenThrow(Exception('error'));

      expect(
        () => postRepository.createPost('Title'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('get post by id', () {
    test('should return a post on success state', () async {
      when(() => mockApiClient.get(any())).thenAnswer(
        (_) async => {
          "id": 1,
          "title": "Test",
          "completed": false,
          "userId": 1,
        },
      );

      final result = await postRepository.getPostById(1);

      expect(result.id, 1);
      expect(result.title, 'Test');
    });

    test('should throw error on failure state', () async {
      when(() => mockApiClient.get(any())).thenThrow(Exception('error'));

      expect(() => postRepository.getPostById(1), throwsA(isA<Exception>()));
    });
  });
}
