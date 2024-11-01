import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutternews/constants/app_strings.dart';
import 'package:flutternews/models/users/articles_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> get getArticles async=> await _getArticles();
  Future<dynamic> _getArticles() async {
    final Uri url = Uri.parse(AppStrings.apiUrlTrend);
    try {
      final http.Response response = await http.get(url);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (data['articles'] != null) {
          List<dynamic> articles = data['articles'];
          return articles
              .map((article) => ArticlesModel.fromJson(article))
              .toList();
        } else {
          return [];
        }
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
   Future<dynamic> get getForYou async=> await _getForYou();
  Future<dynamic> _getForYou() async {
    final Uri url = Uri.parse(AppStrings.apiUrlFor);
    try {
      final http.Response response = await http.get(url);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (data['articles'] != null) {
          List<dynamic> articles = data['articles'];
          return articles
              .map((article) => ArticlesModel.fromJson(article))
              .toList();
        } else {
          return [];
        }
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


   Future<dynamic> get getAll async=> await _getAll();
  Future<dynamic> _getAll() async {
    final Uri url = Uri.parse(AppStrings.apiUrlAll);
    try {
      final http.Response response = await http.get(url);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (data['articles'] != null) {
          List<dynamic> articles = data['articles'];
          return articles
              .map((article) => ArticlesModel.fromJson(article))
              .toList();
        } else {
          return [];
        }
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
