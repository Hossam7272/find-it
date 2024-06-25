import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'network_controller.dart';

class TestNetwork extends StatelessWidget {
  TestNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NetworkController _controller = Get.put(NetworkController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Connection Check Using Getx'),
      ),
      body: Center(
        child: Obx(() => Text(
          _controller.connectionState.value == 1
              ? "Wifi Connected"
              : _controller.connectionState.value == 2
              ? 'Mobile Data Connected'
              : 'No Internet',
          style: const TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}