import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_image_editor_event.dart';
part 'navigation_image_editor_state.dart';

class NavigationImageEditorBloc extends Bloc<NavigationImageEditorEvent, NavigationImageEditorState> {
  NavigationImageEditorBloc() : super(CropImagePage()) {
       on<PageTapped>(_onPageTapped);
    on<AppStarted>(_onAppStarted);
  }

  int currentIndex = 0;

  void _onPageTapped(PageTapped event, Emitter<NavigationImageEditorState> emit) {
    currentIndex = event.index;
    if (currentIndex == 0) {
      emit(CropImagePage());
    }
    if (currentIndex == 1) {
      emit(FilterImagePage());
    }
    if (currentIndex == 2) {
   
      emit(PaintOnImagePage());
    }
  }

  void _onAppStarted(AppStarted event, Emitter<NavigationImageEditorState> emit) {
    emit(CropImagePage());
  }
}
