import 'package:flutter/material.dart';
import 'package:flutternews/controllers/home_controller.dart';
import 'package:flutternews/models/users/articles_model.dart';
import 'package:flutternews/views/widgets/for_you.dart';
import 'package:get/get.dart';

class SearchScreen extends GetWidget<HomeController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Search Article",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.searchedInput,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 30, 30, 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Search articles...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (value) {
                        value = controller.searchedInput.text;
                        controller.searchAll(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    controller.filteredArticles.isEmpty
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
                                  controller.filteredArticles[index];
                              return ForYou(article: article);
                            },
                            separatorBuilder: (_, __) {
                              return const SizedBox(height: 10);
                            },
                            itemCount: controller.filteredArticles.length,
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
