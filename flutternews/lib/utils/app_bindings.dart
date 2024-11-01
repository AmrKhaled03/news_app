import 'package:flutternews/controllers/home_controller.dart';
import 'package:flutternews/controllers/splash_controller.dart';
import 'package:get/instance_manager.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  SplashController(), fenix: true);
    Get.lazyPut(() =>  HomeController(), fenix: true);

  }
}
