import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:video_tape_store/Pages/Utils/Constants.dart';
import 'package:video_tape_store/pages/home/HomePage.dart';

class GoogleAuth {
  static final _OAUTH = GoogleSignIn(scopes: ['email']);
  
  static Future<void> googleSignin(BuildContext context) async {
    try {
      final acc = await _OAUTH.signIn();
      if (acc != null) {
        print("Logged in Email : ${acc.email}");
        
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      }
    } catch (e) {
      print("Google Sign In Error: $e");
    }
  }
}

class AuthService {
  static String get _baseUrl => ApiConstants.baseUrl;
  static String? _currentToken;

  static String? get token => _currentToken;

  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final url = Uri.parse("$_baseUrl/auth/login");
      print('Attempting login to: $url');

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email.trim(), 
          "password": password.trim()
        }),
      ).timeout(
        const Duration(seconds: 15),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');   

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _currentToken = data['token'];
        return data;
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }

    } catch (e) {
      print('Login error: $e');
      return {
        'success': false, 
        'message': 'Connection error: ${e.toString()}'
      };
    }
  }

  static Future<String?> getToken() async {
    return _currentToken;  
  }

  static bool isAdminUser(Map<String, dynamic> userData) {
    return userData['role'] == 'admin';
  }
}