import 'dart:io';
import 'dart:typed_data';

import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BeforeAfterSlice extends StatelessWidget {
  /// Base Image from storage
  final XFile? baseImg;

  /// Base Image without background from api
  final Uint8List? bgRemovedImg;

  /// Value of slice
  final double sliceValue;

  /// Value of slice
  final void Function(double)? onValueChanged;

  const BeforeAfterSlice({
    super.key,
    required this.baseImg,
    required this.bgRemovedImg,
    required this.sliceValue,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cnts) => Container(
        constraints: BoxConstraints(
          maxHeight: 350,
          maxWidth: 350,
          minHeight: cnts.maxHeight > 200 ? 200 : cnts.maxHeight,
          minWidth: cnts.maxWidth > 200 ? 200 : cnts.maxWidth,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BeforeAfter(
              value: sliceValue,
              before: Image.file(File(baseImg!.path)),
              after: Image.memory(bgRemovedImg!),
              onValueChanged: onValueChanged,
            ),
          ),
        ),
      ),
    );
  }
}
