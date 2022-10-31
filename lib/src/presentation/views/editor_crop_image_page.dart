import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsart/src/presentation/bloc/image_edit/image_edit_bloc.dart';

class EditorCropImagePage extends StatelessWidget {
   const EditorCropImagePage({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return BlocBuilder<ImageEditBloc, ImageEditState>(
                  builder: (context, state) {
                    if (state is ImageEditLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ImageEditReady) {
                      return SizedBox(
                          height: 500,
                          child: Image.file(
                            state.image!,
                            fit: BoxFit.contain,
                          ));
                    } else {
                      return const SizedBox();
                    }
                  },
                );
   }
 }