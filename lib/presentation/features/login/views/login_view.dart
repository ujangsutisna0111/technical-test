import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinacltest/presentation/features/login/controllers/login_controller.dart';

class LoginView extends GetView<Logincontroller> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: formLogin(controller.formKey, controller),
        ),
      ),
    );
  }

  Widget formLogin(GlobalKey<FormState> formKey, Logincontroller controller) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth > 600 ? 400 : double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1))],
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Please enter your credentials to continue.',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'User Server is required';
                    }
                    return null;
                  },

                  controller: controller.userServerController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'User Server',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'User id is required';
                    }
                    return null;
                  },

                  controller: controller.userIdController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'User ID',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    controller: controller.passwordController,
                    obscureText: !controller.isShowPassword.value,

                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Password',

                      hintStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isShowPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;
                          // Implement show/hide password functionality
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              controller.isLoading.value = true;
                              controller
                                  .login(
                                    controller.userIdController.text,
                                    controller.passwordController.text,
                                    controller.userServerController.text,
                                  )
                                  .then((message) {
                                    if (message != null) {
                                      Get.snackbar(
                                        'title',
                                        message,
                                        snackPosition: SnackPosition.TOP, // Forces the notification to float at the TOP of the screen!
                                        backgroundColor: Colors.red.shade400,
                                        colorText: Colors.white,
                                        margin: const EdgeInsets.all(15),
                                        icon: const Icon(
                                          Icons.warning,
                                          color: Colors.white,
                                        ),
                                      );
                                    }

                                    Future.delayed((Duration(seconds: 2)), () {
                                      controller.isLoading.value = false;
                                    });
                                  });
                            } else {
                              controller.isLoading.value = false;
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: controller.isLoading.value
                        ? Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'loading ... ',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                  strokeWidth: 2.5,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'Login',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
