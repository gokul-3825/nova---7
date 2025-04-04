import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/lesson.dart';
// ignore: unused_import
import '../models/question.dart';
import '../models/user.dart'; // Assuming you have a User model

class ApiService {
  final String baseUrl = 'YOUR_BACKEND_API_URL'; // *REPLACE THIS WITH YOUR ACTUAL BACKEND URL*
  // *API KEYS (if needed for specific backend services) would be managed securely here or in your backend.*

  // Example: Fetching Lessons
  Future<List<Lesson>> getLessons() async {
    final response = await http.get(Uri.parse('$baseUrl/api/lessons'));
    return _processResponse<List<Lesson>>(response, (data) => (data as List).map((json) => Lesson.fromJson(json)).toList());
  }

  // Example: Fetching a Specific Lesson
  Future<Lesson> getLesson(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/lessons/$id'));
    return _processResponse<Lesson>(response, (data) => Lesson.fromJson(data));
  }

  // Example: Submitting a Quiz
  Future<void> submitQuiz(List<Map<String, dynamic>> answers) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/quizzes'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'answers': answers}),
    );
    _processResponse<void>(response, () {} as void Function(dynamic p1)); // No data to process on success
  }

  // Example: User Login
  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return _processResponse<User>(response, (data) => User.fromJson(data));
  }

  // Example: Getting User Profile (requires a token)
  Future<User> getProfile(String authToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/users/me'),
      headers: {'Authorization': 'Bearer $authToken'}, // Example: Bearer token
    );
    return _processResponse<User>(response, (data) => User.fromJson(data));
  }

  // Helper function to process API responses
  T _processResponse<T>(http.Response response, T Function(dynamic) fromJson) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final dynamic data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      print('API Error: ${response.statusCode} - ${response.body}');
      throw Exception('API request failed with status: ${response.statusCode}');
    }
  }
}