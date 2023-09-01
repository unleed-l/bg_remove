import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickedImage extends StatelessWidget {
  /// Base Image from storage
  final XFile? img;

  const PickedImage({
    super.key,
    required this.img,
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
            child: Image.asset(
              img != null ? img!.path : 'assets/add_image.png',
            ),
          ),
        ),
      ),
    );
  }
}
