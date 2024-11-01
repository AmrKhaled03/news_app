import 'package:flutter/material.dart';
import 'package:flutternews/models/users/articles_model.dart';
import 'package:flutternews/views/widgets/for_you.dart';
import 'package:get/get.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
List<ArticlesModel>articles=Get.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          title: const Text(
            "Trending Articles",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
            

                   articles.isEmpty
                        ? const Center(
                            child: Text(
                              "No articles found.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              ArticlesModel article =
                                  articles[index];
                              return ForYou(article: article);
                            },
                            separatorBuilder: (_, __) {
                              return const SizedBox(height: 10);
                            },
                            itemCount: articles.length,
                          ),
                  ],
                ),
              ),
           
        ),
      ),
    );
  }
}