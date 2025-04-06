import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageField extends StatefulWidget {
  const CustomImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<CustomImageField> createState() => _CustomImageFieldState();
}

class _CustomImageFieldState extends State<CustomImageField> {
  File? imageFile;
  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      imageFile = File(image!.path);
      widget.onFileChanged(imageFile);
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child:
              imageFile != null
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(imageFile!),
                  )
                  : IconButton(
                    onPressed: () async {
                      await pickImage();
                    },
                    icon: Icon(
                      Icons.image_outlined,
                      size: 160,
                      color: Colors.black,
                    ),
                  ),
        ),
        Positioned(
          top: -20,
          left: -10,
          child: Visibility(
            visible: imageFile != null,
            child: IconButton(
              onPressed: () {
                imageFile = null;
                widget.onFileChanged(imageFile);

                setState(() {});
              },
              icon: Icon(Icons.delete, color: Colors.deepOrange, size: 40),
            ),
          ),
        ),
      ],
    );
  }
}
