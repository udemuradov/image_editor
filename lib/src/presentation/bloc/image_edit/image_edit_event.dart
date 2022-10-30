part of 'image_edit_bloc.dart';

abstract class ImageEditEvent extends Equatable {
  const ImageEditEvent(): super();

  @override
  List<Object> get props => [];
}
class ImageEditInit extends ImageEditEvent {
  const ImageEditInit();
}
class UpdateImage extends ImageEditEvent {
  final File image;
  const UpdateImage(this.image);
}
class CropImage extends ImageEditEvent {
   final File image;
  const CropImage(this.image);
}
class SaveImage extends ImageEditEvent {
   final File image;
  const SaveImage(this.image);
}