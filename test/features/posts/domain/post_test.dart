import 'package:flutter_riverpod_sample_v2/features/posts/domain/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('post model', () {
    test('should parse json correctly', () {
      final jsonMap = {'userId': 1, 'id': 1, 'title': 'title'};

      final post = Post.fromJson(jsonMap);

      expect(post, isA<Post>());
      expect(post.id, 1);
      expect(post.title, 'title');
      expect(post.completed, false);
    });
  });
}
