import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (box.read('dataRememberme') != null) {
      Map<String, dynamic> dataSimpanan = box.read('dataRememberme');

      controller.emailC.text = dataSimpanan["email"];
      controller.passC.text = dataSimpanan["password"];

      controller.rememberme.value = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          Obx(
            () => TextField(
              controller: controller.passC,
              autocorrect: false,
              obscureText: controller.isHidden.value,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => controller.isHidden.toggle(),
                  icon: Icon(
                    controller.isHidden.isTrue ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Obx(
            () => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: controller.rememberme.value,
              onChanged: (_) => controller.rememberme.toggle(),
              title: Text("Remember me"),
            ),
          ),
          SizedBox(height: 35),
          ElevatedButton(
            onPressed: () => controller.login(),
            child: Text("LOGIN"),
          ),
        ],
      ),
    );
  }
}