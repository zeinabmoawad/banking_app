import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/user_information.dart';

class Users with ChangeNotifier {
  List<UserInformation> usersinfo = [];
  String url =
      Platform.isAndroid ? 'http://192.168.1.3:8000' : 'http://localhost:8000';
      
  List<UserInformation> get gettingusers {
    return [...usersinfo];
  }
  Future<void> fetchAllusers() async {
    try {
      final response = await http.get(Uri.parse('$url/allusers'));
      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      if (extracteddata == null) {
        return;
      }
      final data = extracteddata['users'];
      List<UserInformation> users = [];
      for (var user in data) {
        users.add(UserInformation(
            userName: user['userName'],
            profilePhoto: user['profilePhoto'],
            name: user['name'],
            email: user['email'],
            phone: user['phone'],
            balance: double.parse(user['balance'].toString())));
      }
      ;
      usersinfo = users;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transferMoneyToUser(
      String usernameFrom, String usernameTo, double amount) async {
    var urlParse =
        Uri.parse('$url/Transfer/$usernameFrom/$usernameTo/$amount');
    try {
      var response = await http.post(urlParse);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
