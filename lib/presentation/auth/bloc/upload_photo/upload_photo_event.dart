part of 'upload_photo_bloc.dart';

abstract class UploadPhotoEvent {}

class UploadPhoto extends UploadPhotoEvent {
  final File imageFile;

  UploadPhoto({required this.imageFile});
}
