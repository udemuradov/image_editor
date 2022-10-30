import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsart/src/presentation/bloc/image_edit/image_edit_bloc.dart';
import 'package:picsart/src/presentation/bloc/navigation_image_editor/navigation_image_editor_bloc.dart';


class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<NavigationImageEditorBloc>(create: (context) => NavigationImageEditorBloc()),
    BlocProvider<ImageEditBloc>(create: (context) => ImageEditBloc()),
  ];
}
