import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:techinacltest/app/data/repositories/securestorage.dart';
import 'package:techinacltest/app/data/services/apiservice.dart';
import 'package:techinacltest/app/routes/app_routes.dart';

class Logincontroller extends GetxController {
  final dioService = DioService();
  final secureStorage = SecureStorage();

  RxBool isShowPassword = false.obs;

  RxBool isLoading = false.obs;

  TextEditingController userIdController = TextEditingController(text: 'admin');
  TextEditingController passwordController = TextEditingController(
    text: 'admin',
  );
  TextEditingController userServerController = TextEditingController(
    text: 'cooluruz',
  );
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<String?> login(
    String userId,
    String password,
    String userSever,
  ) async {
    Map<String, dynamic> payload = {};
    payload['from_origin'] = '*';
    payload['userServer'] = userSever;
    payload['userId'] = userId;
    payload['userPassword'] = password;
    payload['envServer'] = dotenv.env['ENV_SERVER'] ?? '';
    payload['referrer'] = dotenv.env['REFERRER'] ?? '';

    final response = await dioService.post('authV5', payload);
    if (response.statusCode == 201) {
      // Map data = response.data['data'];
      // await secureStorage.set(SecurestorageKey.token, data);
      Get.offAllNamed(Routes.dashboard);
      return null;
    } else {
      return response.data['message'];
    }
  }
}
