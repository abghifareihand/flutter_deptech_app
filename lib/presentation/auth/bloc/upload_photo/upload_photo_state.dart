part of 'upload_photo_bloc.dart';

abstract class UploadPhotoState {}

class UploadPhotoInitial extends UploadPhotoState {}

class UploadPhotoLoading extends UploadPhotoState {}

class UploadPhotoLoaded extends UploadPhotoState {
  final ImageResponse imageResponse;

  UploadPhotoLoaded({required this.imageResponse});
}

class UploadPhotoError extends UploadPhotoState {
  final String message;

  UploadPhotoError({required this.message});
}
