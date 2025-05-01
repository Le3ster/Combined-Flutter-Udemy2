import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Widget that lets users select an image from their device.
class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  /// Opens the image picker and updates selected image.
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (pickedImage == null) return;

    final imageFile = File(pickedImage.path);

    setState(() {
      _selectedImage = imageFile;
    });

    widget.onPickImage(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: theme.colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: _selectedImage != null
          ? GestureDetector(
        onTap: _pickImage,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      )
          : TextButton.icon(
        onPressed: _pickImage,
        icon: const Icon(Icons.camera),
        label: const Text('Take Picture'),
      ),
    );
  }
}
