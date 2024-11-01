import 'package:flutter/material.dart';
import 'package:flutternews/models/users/articles_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<ArticlesModel> trendingArticles = [];
  List<ArticlesModel> forYouArticles = [];
  List<ArticlesModel> allArticles = [];
  List<ArticlesModel> filteredArticles = [];

  bool isLoadingTrend = true;
  bool isLoadingFor = true;
  bool isLoadingAll = true;
  TextEditingController searchedInput = TextEditingController();
  dynamic response = Get.arguments;

  void checkData() async {
    isLoadingTrend = true;
    isLoadingFor = true;
    isLoadingAll = true;

    update();

    try {
      if (response != null) {
        if (response['trending'] != null) {
          trendingArticles.assignAll(response["trending"]);
        } else {
          trendingArticles.clear();
        }

        if (response['forYou'] != null) {
          forYouArticles.assignAll(response["forYou"]);
        } else {
          forYouArticles.clear();
        }
        if (response['allArticles'] != null) {
          allArticles.assignAll(response["allArticles"]);
        } else {
          forYouArticles.clear();
        }
       
        filteredArticles.assignAll(allArticles);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingTrend = false;
      isLoadingFor = false;
      isLoadingAll = false;

      update();
    }
  }

  Future<void> searchAll(String word) async {
    if (word.isEmpty) {
      filteredArticles.assignAll(allArticles); 
    } else {
      filteredArticles.assignAll(allArticles.where((article) {
        return article.title.toLowerCase().contains(word.toLowerCase());
      }).toList());
    }
    update(); 
  }

  @override
  void onInit() {
    super.onInit();
    checkData();
  }
}
