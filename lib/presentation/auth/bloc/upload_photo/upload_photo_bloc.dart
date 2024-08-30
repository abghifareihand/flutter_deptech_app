import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deptech_app/data/models/response/image_response_model.dart';

import '../../../../data/datasources/auth_remote_datasource.dart';

part 'upload_photo_event.dart';
part 'upload_photo_state.dart';

class UploadPhotoBloc extends Bloc<UploadPhotoEvent, UploadPhotoState> {
  UploadPhotoBloc() : super(UploadPhotoInitial()) {
    on<UploadPhoto>((event, emit) async {
      emit(UploadPhotoLoading());
      final result = await AuthRemoteDatasource().uploadPhoto(event.imageFile);
      result.fold(
        (error) => emit(UploadPhotoError(message: error)),
        (data) => emit(UploadPhotoLoaded(imageResponse: data)),
      );
    });
  }
}
