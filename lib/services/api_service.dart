import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/models/suggestion.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Suggestion> getSuggestion(String id) async {
    final url = Uri.https(
      'www.boredapi.com',
      '/api/activity',
      {'q': '{http}'},
    );

    // Await the HTTP GET response, then decode the
    // JSON data it contains.
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      final activity = jsonResponse['activity'];
      print('activity: $activity.');
      return Suggestion.fromJson(jsonResponse.data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Error getting suggestion');
    }
  }
}
