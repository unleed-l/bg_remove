import 'package:bg_remover/src/controllers/remover_page_controller.dart';
import 'package:bg_remover/src/repositories/remove_bg_repositorie.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

setUpRemoveRepository() {
  Get.put<RemoverPageController>(
    RemoverPageController(
      BGRemoveAPI(
        dio: Dio(),
      ),
    ),
  );
}
