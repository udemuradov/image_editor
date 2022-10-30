part of 'image_edit_bloc.dart';

abstract class ImageEditState extends Equatable {
  final File? image;
  const ImageEditState({
    this.image
  }) : super();

  @override
  List<Object?> get props => [image];
}

class ImageEditInitial extends ImageEditState {
  const ImageEditInitial() : super();
}
class ImageEditLoading extends ImageEditState {
  const ImageEditLoading() : super();
}

class ImageEditReady extends ImageEditState {
  const ImageEditReady(File? image) : super(image: image);
}

