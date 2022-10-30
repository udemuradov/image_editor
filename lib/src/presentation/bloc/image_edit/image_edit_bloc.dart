import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_cropper/image_cropper.dart';

part 'image_edit_event.dart';
part 'image_edit_state.dart';

class ImageEditBloc extends Bloc<ImageEditEvent, ImageEditState> {
  // File? img;
  ImageEditBloc() : super(const ImageEditInitial()) {
    //  on<ImageEditInit>((event, emit) {
    //   emit(const ImageEditLoading());
    // });
    on<UpdateImage>((event, emit) {
      emit(ImageEditReady(event.image));
    });
    on<CropImage>((event, emit) async {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: event.image.path,
      );
      File img = File(croppedFile!.path);
      emit(ImageEditReady(img));
    });
    on<SaveImage>((event, emit) async {
      await GallerySaver.saveImage(event.image.path);
      emit(ImageEditReady(event.image));
    });
  }
}
