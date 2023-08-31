import 'package:bg_remover/src/controllers/remover_page.dart/remover_page_controller.dart';
import 'package:bg_remover/src/dependencies/remove_bg_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class RemoverPage extends StatefulWidget {
  const RemoverPage({super.key});

  @override
  State<RemoverPage> createState() => _RemoverPageState();
}

class _RemoverPageState extends State<RemoverPage> {
  late final RemoverPageController controller;

  @override
  void initState() {
    super.initState();
    setUpRemoveRepository();
    controller = Get.find<RemoverPageController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BG Remover'),
        actions: [
          IconButton(
            onPressed: controller.downloadImage,
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Obx(
        () => const Column(
          children: [],
        ),
      ),
    );
  }
}
