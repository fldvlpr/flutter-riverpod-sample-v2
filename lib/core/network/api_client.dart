import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final http.Client client;

  ApiClient({required this.baseUrl, required this.client});

  Future<dynamic> get(String endpoint) async {
    final response = await client.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> params) async {
    final response = await client.post(
      Uri.parse('$baseUrl$endpoint'),
      body: params,
      headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

final baseUrlProvider = Provider<String>((ref) {
  return 'https://dummyjson.com';
});

final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    baseUrl: ref.watch(baseUrlProvider),
    client: ref.watch(httpClientProvider),
  );
});
