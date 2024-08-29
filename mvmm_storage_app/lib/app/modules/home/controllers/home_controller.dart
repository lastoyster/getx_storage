import 'package:get/get.dart';
import 'package:mvmm_storage_app/app/routes/app_pages.dart';

class HomeController extends GetXController{
  void logout(){
    Get.offAllNamed(Routes.LOGIN);
  }
}