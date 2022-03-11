import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDIR1yvIaA4IAvp7AfHjvu3IDphlpjqVf8';

  final storage = new FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async{

    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password 
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key' : _firebaseToken
    });

    final resp = await http.post(url, body: json.encode( authData ));
    final Map<String, dynamic> decodeResp = json.decode( resp.body );

    if(decodeResp.containsKey('idToken')){

      storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    }else{
      return decodeResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {

    Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(loginData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if(decodeResp.containsKey('idToken')){
      storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    }else{
      return decodeResp['error']['message'];
    }

  }

}