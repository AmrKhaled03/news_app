import 'package:flutter/material.dart';
import 'package:flutternews/constants/app_strings.dart';
import 'package:flutternews/models/services/api_services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  ApiServices apiServices = ApiServices();
  Future<void> fetchArticles() async {
    try {
      final trending = await apiServices.getArticles;
      final forYou = await apiServices.getForYou;
      final allArticles = await apiServices.getAll;

      await Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(AppStrings.homeRoute,
            arguments: {"trending": trending, "forYou": forYou,"allArticles":allArticles});
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }
}
