// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'dart:typed_data';
import 'package:bg_remover/src/repositories/remove_bg_repositorie.dart';
import 'package:bg_remover/src/utils/custom_toaster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RemoverPageController extends GetxController {
  final BGRemoveAPI _repository;
  late final Rx<XFile?> _baseImg = Rx<XFile?>(null);
  late final Rx<Uint8List?> _bgRemoved = Rx<Uint8List?>(null);
  final RxBool _isloading = false.obs;
  final RxDouble _sliceValue = 0.5.obs;

  XFile? get baseImg => _baseImg.value;
  Uint8List? get bgRemoved => _bgRemoved.value;
  bool get isloading => _isloading.value;
  double get sliceValue => _sliceValue.value;

  void setSliceValue(double value) => _sliceValue.value = value;

  RemoverPageController(this._repository);

  void btnPressed(BuildContext context) {
    if (_baseImg.value == null) {
      _pickImage(context);
    } else if (_bgRemoved.value == null) {
      _getBGRemovedImage(context);
    } else {
      _baseImg.value = null;
      _bgRemoved.value = null;
      _pickImage(context);
    }
  }

  Future<void> _pickImage(BuildContext context) async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      _baseImg.value = img;
      if (_baseImg.value == null) throw 'Ocorreu um erro ao carregar a imagem';
    } catch (e) {
      debugPrint(e.toString());
      CustomToast.errorToast(e.toString()).show(context);
    }
  }

  Future<void> _getBGRemovedImage(BuildContext context) async {
    _isloading.value = true;

    try {
      _bgRemoved.value = await _repository.getRemoveBG(_baseImg.value!.path);
    } catch (e) {
      debugPrint(e.toString());
      CustomToast.errorToast(e.toString()).show(context);
    }
    _isloading.value = false;
  }

  Future<void> downloadImage(BuildContext context) async {
    if (await Permission.storage.request() != PermissionStatus.granted) {
      CustomToast.warningToast(
        'Não é possível baixar a imagem sem permissão de armazenamento',
      ).show(context);
    } else {
      final pathToSave = '${_baseImg.value!.path} + _bgRemoved';

      bool ok = true;
      if (await _checkIfExists(pathToSave)) {
        ok = await _deleteFile(pathToSave);
      }

      if (ok) {
        // await _saveImg(pathToSave);
      } else {
        CustomToast.warningToast('Não foi possível baixar a imagem')
            .show(context);
      }
    }
  }

  Future<bool> _deleteFile(String path) async {
    try {
      final file = File(path);
      await file.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _checkIfExists(String path) async {
    final file = File(path);
    return await file.exists();
  }

  // Future<void> _saveImg(String pathToSave) async =>
  //     await _bgRemoved.value!.saveTo(pathToSave);
}
