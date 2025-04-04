import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/lesson_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/assignment_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/settings_screen.dart';
import 'providers/user_provider.dart';
import 'providers/lesson_provider.dart';
import 'providers/quiz_provider.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart'; // Import AuthService
import 'services/api_service.dart'; //Import ApiService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize your services
  final AuthService authService = AuthService();
  final ApiService apiService = ApiService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider(authService: authService)),
        ChangeNotifierProvider(create: (context) => LessonProvider(apiService: apiService)),
        ChangeNotifierProvider(create: (context) => QuizProvider(apiService: apiService)),
        // Add other providers here if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Educational App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/lesson': (context) => LessonScreen(),
        '/quiz': (context) => QuizScreen(),
        '/profile': (context) => ProfileScreen(),
        '/assignment': (context) => AssignmentScreen(),
        '/chat': (context) => ChatScreen(),
        '/settings': (context) => SettingsScreen(),
        // You can define more specific routes here, for example:
        // '/lesson/details': (context) => LessonDetailsScreen(),
        // '/quiz/start': (context) => StartQuizScreen(),
      },
      // You can also define an onGenerateRoute for more dynamic routing
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/lesson/details') {
      //     final int lessonId = settings.arguments as int;
      //     return MaterialPageRoute(
      //       builder: (context) => LessonDetailsScreen(lessonId: lessonId),
      //     );
      //   }
      //   return null; // Handle unknown routes
      // },
    );
  }
}