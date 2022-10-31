part of 'navigation_image_editor_bloc.dart';

abstract class NavigationImageEditorEvent extends Equatable {
  const NavigationImageEditorEvent();

  @override
  List<Object> get props => [];
}
class AppStarted extends NavigationImageEditorEvent {
  @override
  String toString() => 'AppStarted';
}

class PageTapped extends NavigationImageEditorEvent {
  final int index;

  const PageTapped({required this.index});

  @override
  String toString() => 'PageTapped: $index';
}