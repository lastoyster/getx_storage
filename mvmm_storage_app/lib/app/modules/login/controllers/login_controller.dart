import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_storage/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  final box = GetStorage();

  RxBool isHidden = true.obs;
  RxBool rememberme = false.obs;

  var akunPalsu = {
    "email": "palsu@gmail.com",
    "password": "admin",
  };

  void login() {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      if (emailC.text == akunPalsu["email"] && passC.text == akunPalsu["password"]) {
        // proses login berhasil
        if (box.read('dataRememberme') != null) {
          box.remove('dataRememberme');
        }

        if (rememberme.isTrue) {
          box.write(
            'dataRememberme',
            {
              "email": emailC.text,
              "password": passC.text,
            },
          );
        }

        Get.offAllNamed(Routes.HOME);
      } else {
        late String errMsg;

        if (emailC.text != akunPalsu["email"]) {
          errMsg = "Email tidak terdaftar.";
        } else if (passC.text != akunPalsu["password"]) {
          errMsg = "Password salah.";
        } else {
          errMsg = "Tidak dapat login.";
        }

        Get.snackbar(
          "Error",
          errMsg,
          duration: Duration(milliseconds: 1500),
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Semua input harus diisi.",
        duration: Duration(milliseconds: 1500),
        colorText: Colors.white,
      );
    }
  }
}