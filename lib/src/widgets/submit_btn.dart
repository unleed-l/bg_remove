import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SubmitBtn extends StatelessWidget {
  /// Controls when image background is loading or not
  final bool isloading;

  /// Base Image from storage
  final XFile? baseImg;

  /// Base Image without background from api
  final Uint8List? bgRemovedImg;

  /// Function called when button is tapped
  final void Function()? onPressed;

  const SubmitBtn({
    super.key,
    required this.isloading,
    required this.baseImg,
    required this.bgRemovedImg,
    required this.onPressed,
  });

  String btnLabel() {
    if (baseImg == null) {
      return 'Selecionar imagem base';
    } else if (bgRemovedImg == null) {
      return 'Remover background';
    }

    return 'Selecionar outra imagem';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: isloading
          ? const SizedBox(
              height: kMinInteractiveDimension,
              width: kMinInteractiveDimension,
              child: CircularProgressIndicator(strokeWidth: 5),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  kMinInteractiveDimension * 1.5,
                  kMinInteractiveDimension,
                ),
              ),
              onPressed: onPressed,
              child: Text(
                btnLabel(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
    );
  }
}
