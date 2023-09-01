import 'package:bg_remover/src/controllers/remover_page_controller.dart';
import 'package:bg_remover/src/dependencies/remove_bg_binding.dart';
import 'package:bg_remover/src/widgets/before_after_slice.dart';
import 'package:bg_remover/src/widgets/picked_image.dart';
import 'package:bg_remover/src/widgets/submit_btn.dart';
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BG Remover',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (controller.bgRemoved != null)
            IconButton(
              onPressed: () => controller.downloadImage(context),
              icon: const Icon(Icons.download),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Obx(
                  () => switch (controller.bgRemoved) {
                    null => PickedImage(img: controller.baseImg),
                    _ => BeforeAfterSlice(
                        baseImg: controller.baseImg,
                        bgRemovedImg: controller.bgRemoved,
                        sliceValue: controller.sliceValue,
                        onValueChanged: controller.setSliceValue,
                      ),
                  },
                ),
              ),
            ),
            Obx(
              () => SubmitBtn(
                isloading: controller.isloading,
                baseImg: controller.baseImg,
                bgRemovedImg: controller.bgRemoved,
                onPressed: () => controller.btnPressed(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
