import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinacltest/presentation/features/dashboard/controllers/dashboard_controllers.dart';

class DashboardView extends GetView<DashboardControllers> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Welcome')));
  }
}
