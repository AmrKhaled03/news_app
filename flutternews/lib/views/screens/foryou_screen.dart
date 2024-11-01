import 'package:flutter/material.dart';
import 'package:flutternews/models/users/articles_model.dart';
import 'package:flutternews/views/widgets/article_box.dart';
import 'package:get/get.dart';

class ForyouScreen extends StatelessWidget {
  const ForyouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ArticlesModel> articles = Get.arguments;
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
            "For You Articles",
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
                    : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,mainAxisSpacing: 10),
                        itemBuilder: (_, index) {
                          ArticlesModel article = articles[index];
                          return ArticleBox(article: article);
                        },itemCount: articles.length,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
