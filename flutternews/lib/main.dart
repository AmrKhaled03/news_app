import 'package:flutter/material.dart';
import 'package:flutternews/constants/app_strings.dart';
import 'package:flutternews/utils/app_bindings.dart';
import 'package:flutternews/views/screens/details_screen.dart';
import 'package:flutternews/views/screens/foryou_screen.dart';
import 'package:flutternews/views/screens/home_screen.dart';
import 'package:flutternews/views/screens/search_screen.dart';
import 'package:flutternews/views/screens/splash_screen.dart';
import 'package:flutternews/views/screens/trending_screen.dart';
import 'package:get/route_manager.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
getPages: [
GetPage(name: AppStrings.splashRoute, page: ()=>const SplashScreen()),
GetPage(name: AppStrings.homeRoute, page: ()=>const HomeScreen()),
GetPage(name: AppStrings.searchRoute, page: ()=>const SearchScreen()),
GetPage(name: AppStrings.trendingRoute, page: ()=>const TrendingScreen()),
GetPage(name: AppStrings.forRoute, page: ()=>const ForyouScreen()),
GetPage(name: AppStrings.detailsRoute, page: ()=>const DetailsScreen()),





],
initialRoute: AppStrings.splashRoute,
initialBinding:AppBindings() ,
    );
  }
}
