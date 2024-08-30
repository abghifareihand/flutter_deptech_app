import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/presentation/auth/bloc/upload_photo/upload_photo_bloc.dart';

// Fungsi untuk mengambil gambar dari kamera atau galeri
Future<void> pickImage(
  BuildContext context,
  ImageSource source, {
  required Function(File) onImagePicked,
}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(
    source: source,
    imageQuality: 50,
  );

  if (photo != null) {
    final File imageFile = File(photo.path); // Convert XFile to File

    if (context.mounted) {
      // Jika widget masih terpasang
      onImagePicked(imageFile);

      // Kirim event untuk meng-upload foto
      context.read<UploadPhotoBloc>().add(UploadPhoto(imageFile: imageFile));
    }
  }
}
