import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences _prefs;
  String? _token;
  bool _isLoggedIn = false;
  bool _rememberMe = false;

  AuthProvider(this._prefs) {
    _loadAuthState();
  }

  String? get token => _token;
  bool get isLoggedIn => _isLoggedIn;
  bool get rememberMe => _rememberMe;

  Future<void> _loadAuthState() async {
    _token = _prefs.getString('auth_token');
    _rememberMe = _prefs.getBool('remember_me') ?? false;
    _isLoggedIn = _token != null;
    notifyListeners();
  }

  Future<bool> checkLoginStatus() async {
    await _loadAuthState();
    return _isLoggedIn;
  }

  Future<bool> login(String username, String password, bool rememberMe) async {
    try {
      // Simulate API call - replace with actual API endpoint
      await Future.delayed(const Duration(seconds: 1));
      
      // For demo purposes, accept any non-empty credentials
      if (username.isNotEmpty && password.isNotEmpty) {
        _token = 'demo_token_${DateTime.now().millisecondsSinceEpoch}';
        _isLoggedIn = true;
        _rememberMe = rememberMe;
        
        // Save to shared preferences
        if (rememberMe) {
          await _prefs.setString('auth_token', _token!);
          await _prefs.setBool('remember_me', true);
        }
        
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    _isLoggedIn = false;
    
    // Clear stored data
    await _prefs.remove('auth_token');
    await _prefs.remove('remember_me');
    
    notifyListeners();
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }
} 