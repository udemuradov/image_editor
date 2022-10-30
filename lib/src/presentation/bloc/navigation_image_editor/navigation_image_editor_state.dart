part of 'navigation_image_editor_bloc.dart';

abstract class NavigationImageEditorState extends Equatable {
  const NavigationImageEditorState();
  
  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends NavigationImageEditorState {
  final int currentIndex;

  const CurrentIndexChanged({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class CropImagePage extends NavigationImageEditorState {
  @override
  String toString() => 'CropImagePage';
}

class FilterImagePage extends NavigationImageEditorState {
  @override
  String toString() => 'FilterImagePage';
}

class PaintOnImagePage extends NavigationImageEditorState {
  @override
  String toString() => 'PaintOnImagePage';
}
