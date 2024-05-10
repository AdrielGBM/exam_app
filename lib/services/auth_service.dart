import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = "AIzaSyDy7ctFP9X1tbBTYn-E_yP4IeauLl7_SCM";

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password,
    };
    final url = Uri.https(
        _baseUrl, "/v1/accounts:signInWithPassword", {"key": _firebaseToken});
    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResponse = json.decode(response.body);
    if (decodedResponse.containsKey("idToken")) {
      return decodedResponse["idToken"];
    } else {
      return null;
    }
  }

  Future<String?> register(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password,
    };
    final url =
        Uri.https(_baseUrl, "/v1/accounts:signUp", {"key": _firebaseToken});
    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResponse = json.decode(response.body);
    if (decodedResponse.containsKey("idToken")) {
      return decodedResponse["idToken"];
    } else {
      return null;
    }
  }

  Future<String?> resetPassword(String email) async {
    final Map<String, dynamic> authData = {
      "requestType": "PASSWORD_RESET",
      "email": email,
    };
    final url = Uri.https(
        _baseUrl, "/v1/accounts:sendOobCode", {"key": _firebaseToken});
    await http.post(url, body: json.encode(authData));
    return null;
  }
}
