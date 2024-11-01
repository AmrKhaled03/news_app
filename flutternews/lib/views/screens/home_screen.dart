import 'package:flutter/material.dart';
import 'package:flutternews/constants/app_strings.dart';
import 'package:flutternews/controllers/home_controller.dart';
import 'package:flutternews/models/users/articles_model.dart';
import 'package:flutternews/views/widgets/article_box.dart';
import 'package:flutternews/views/widgets/for_you.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          title: const Text(
            AppStrings.appTitle,
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                controller.isLoadingTrend
                    ? const Center(child: CircularProgressIndicator())
                    : controller.trendingArticles.isEmpty
                        ? Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "NO ARTICLES FOUND",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "Hottest News",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  TextButton(
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.blue),
                                    ),
                                    onPressed: () {
                                      Get.toNamed(AppStrings.trendingRoute,
                                          arguments:
                                              controller.trendingArticles);
                                    },
                                    child: const Text(
                                      "See All",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 350,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    ArticlesModel article =
                                        controller.trendingArticles[index];
                                    return ArticleBox(article: article);
                                  },
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: 10),
                                  itemCount: controller.trendingArticles.length,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "News For You",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  TextButton(
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.blue),
                                    ),
                                    onPressed: () {
                                      Get.toNamed(AppStrings.forRoute,
                                          arguments: controller.forYouArticles);
                                    },
                                    child: const Text(
                                      "See All",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              controller.isLoadingFor
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (_, index) {
                                        ArticlesModel article =
                                            controller.forYouArticles[index];
                                        return ForYou(article: article);
                                      },
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 10),
                                      itemCount:
                                          controller.forYouArticles.length,
                                    ),

                            ],
                          ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
       
          ],
          onTap: (index) {
 
            switch (index) {
              case 0:

                Get.toNamed(AppStrings.homeRoute);
                break;
              case 1:

                Get.toNamed(AppStrings.searchRoute);
                break;
          
            }
          },)
      ),
    );
  }
}
