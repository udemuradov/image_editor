import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsart/src/core/utils/app_colors.dart';
import 'package:picsart/src/presentation/bloc/image_edit/image_edit_bloc.dart';

class EditorPaintImagePage extends StatefulWidget {
  const EditorPaintImagePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditorPaintImagePage> createState() => _EditorPaintImagePageState();
}

class _EditorPaintImagePageState extends State<EditorPaintImagePage> {
  ColorFilter fill = colorFilter.first;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageEditBloc, ImageEditState>(
        builder: (context, state) {
      if (state is ImageEditLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ImageEditReady) {
        return SizedBox(
          height: 300,
          child: ColorFiltered(
            colorFilter: fill,
            //colorFilter: ColorFilter.mode(Colors.orange, BlendMode.color),
            child: Image.file(
              state.image!,
              fit: BoxFit.contain,
            ),
          ),
        );
      } else {
        return Text('some error');
      }
    });
  }
}
