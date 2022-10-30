import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photofilters/photofilters.dart';
import 'package:picsart/src/core/utils/app_colors.dart';
import 'package:image/image.dart' as imageLib;
import 'package:picsart/src/presentation/bloc/image_edit/image_edit_bloc.dart';
import 'package:picsart/src/presentation/bloc/navigation_image_editor/navigation_image_editor_bloc.dart';
import 'package:picsart/src/presentation/views/editor_crop_image_page.dart';
import 'package:picsart/src/presentation/views/editor_filter_image_page.dart';

class NavigationImageEditorPage extends StatefulWidget {
  const NavigationImageEditorPage({Key? key}) : super(key: key);

  @override
  State<NavigationImageEditorPage> createState() =>
      _NavigationImageEditorPageState();
}

class _NavigationImageEditorPageState extends State<NavigationImageEditorPage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: BlocBuilder<ImageEditBloc, ImageEditState>(
          builder: (context, state) {
            if (state is ImageEditLoading) {
              return CircularProgressIndicator();
            }
            if (state is ImageEditReady) {
              return AppBar(
                backgroundColor: AppColors.appButtons,
                actions: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<ImageEditBloc>(context)
                            .add(SaveImage(state.image!));
                        Navigator.of(context).pushNamed('/');
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content:
                                    Text("Изображение сохранено в галерею"),
                              );
                            });
                      },
                      icon: Icon(Icons.save))
                ],
                // title: const Text("Edit Image"),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<NavigationImageEditorBloc, NavigationImageEditorState>(
            builder: (context, state) {
              if (state is CropImagePage) {
                return const EditorCropImagePage();
              }
              if (state is FilterImagePage) {
                return EditorFilterImagePage();

                // ColorFiltered(
                //   colorFilter: colorFilter[2],
                //   //colorFilter: ColorFilter.mode(Colors.orange, BlendMode.color),
                //   child: SizedBox(
                //       height: 500,
                //       child: Image.file(
                //         widget.image,
                //         fit: BoxFit.contain,
                //       )),
                // );
              }
              if (state is PaintOnImagePage) {
                return const Text('paint');
              }
              return Container();
            },
          ),
          BlocBuilder<ImageEditBloc, ImageEditState>(
            builder: (context, state) {
              if (state is ImageEditLoading) {
                return Text('data');
              }
              if (state is ImageEditReady) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<NavigationImageEditorBloc>()
                              .add(PageTapped(index: 0));
                          setState(() {
                            activeIndex = 0;
                          });
                          BlocProvider.of<ImageEditBloc>(context)
                              .add(CropImage(state.image!));
                        },
                        icon: Icon(
                          Icons.crop,
                          color: AppColors.appButtons,
                        )),
                    IconButton(
                        onPressed: () async {
                          context
                              .read<NavigationImageEditorBloc>()
                              .add(PageTapped(index: 1));

                          setState(() {
                            activeIndex = 1;
                          });
                        },
                        icon: Icon(Icons.filter, color: AppColors.appButtons)),
                    IconButton(
                        onPressed: () {
                          context
                              .read<NavigationImageEditorBloc>()
                              .add(PageTapped(index: 2));
                          setState(() {
                            activeIndex = 2;
                          });
                        },
                        icon: Icon(Icons.edit, color: AppColors.appButtons)),
                  ],
                );
              } else {
                return Text('obj');
              }
            },
          )
        ],
      ),
    );
  }

  // Future<File?> cropImage({required File image}) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: widget.image.path,
  //   );
  //   setState(() {
  //     widget.image = File(croppedFile?.path ?? widget.image.path);
  //   });
  //   if (croppedFile == null) return widget.image;
  //   return File(croppedFile.path);
  // }
}
