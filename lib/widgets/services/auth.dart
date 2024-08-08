import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  int _counter = 0;
  String? _user;
  Dio dio = Dio();
  String? _token;
  DateTime? _expiryDate;
  String url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBWo6dVN7s0ZqqW_eblrTC6NW3Ey2yXUcU';

  bool get isAuth {
    // return false;

    return token != null;
  }

  String? get token {
    if (_token != null
        // &&
        // _expiryDate != null &&
        // _expiryDate!.isAfter(DateTime.now())
        ) {
      return _token;
    }
    return null;
  }

  String? get user {
    return _user;
  }

  Future<String?> logIn(String email, String password) async {
    print(email);
    try {
      var response = await dio.post(
        url,
        data: {
          // 'email': 'aslam@gmail.com',
          // 'password': 'Aslam@1996',
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      );

      var mappedData = response.data as Map;
      if (mappedData.containsKey('localId')) {
        _user = mappedData['email'];
        _token = mappedData['idToken'];

        var parsedDate = mappedData['expiresIn'];

        _expiryDate =
            DateTime.now().add(Duration(seconds: int.parse(parsedDate)));

        var userData = jsonEncode({
          'token': _token,
          'expiryDate': _expiryDate?.toIso8601String(),
        });

        var prefs = await SharedPreferences.getInstance();
        prefs.setString('user', userData);

        notifyListeners();
        return '';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> autoLogIn() async {
    print('running autologin');

    var prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('user')) {
      return false;
    }
    var userData = jsonDecode(prefs.getString('user')!) as Map<String, dynamic>;

    _token = userData['token'];
    // _expiryDate = userData['expiryDate'];
    print(userData);
    print(_counter);

    if (_counter == 0) {
      _counter = 1;
      notifyListeners();
    }
    return true;
  }

  Future<void> clearToken() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _token = null;
    notifyListeners();
  }
}
