import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/ger.dart';
import 'package:mvmm_storage_app/app/modules/home/bindings/controllers/home_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView <HomeController>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text("HomeView"),
        centerTitle: true,
      ),
  body:Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Text(
          'Homeview is not working',
          style: TextStyle(fontSize: 20),
        ),
    ElevatedButton(
      onPressed: ()=>
      controller.logout(),
     child:const Text("LOGOUT"),
     ),
      ],
    ),
  ),
    );
  }
}
