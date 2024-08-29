import 'package:get/get.dart';
import 'package:mvmm_storage_app/app/modules/home/views/home_view.dart';
import 'package:mvmm_storage_app/app/modules/home/bindings/home_binding.dart';
import 'package:mvmm_storage_app/app/modules/login/bindings/home_binding.dart';
import 'package:mvmm_storage_app/app/modules/login/views/bindings/login_view.dart';
part  'app_routes.dart';
class AppPages{
  AppPages._();

  static const INITIAL = Routes.HOME;
 

  static final routes=[
    GetPage(
      name:_Paths.HOME,
      page:()=>HomeView(),
      binding:HomeBinding(),
    ),
  GEtPage(
    name:_Paths.LOGIN,
    page:()=> LoginView(),
    binding:LoginBinding(),
  ),
  ];
}