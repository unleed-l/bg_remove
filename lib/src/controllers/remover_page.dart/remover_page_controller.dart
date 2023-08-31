import 'package:bg_remover/src/repositories/remove_bg_repositorie.dart';
import 'package:bg_remover/src/utils/custom_toaster.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RemoverPageController extends GetxController {
  final BGRemoveAPI repository;
  Rx<XFile?> baseImg = null.obs;
  Rx bgRemoved = null.obs;
  final RxBool isloading = false.obs;

  RemoverPageController({required this.repository});

  Future<void> pickImage() async {
    try {
      baseImg.value = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (baseImg.value == null) throw 'Ocorreu um erro ao carregar a imagem';
    } catch (e) {
      CustomToast.errorToast(e.toString());
    }
  }

  Future<void> getBGRemovedImage() async {}

  Future<void> downloadImage() async {}
}
