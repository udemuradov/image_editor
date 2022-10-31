import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsart/src/core/utils/app_colors.dart';
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
        preferredSize: const Size.fromHeight(40),
        child: BlocBuilder<ImageEditBloc, ImageEditState>(
          builder: (context, state) {
            if (state is ImageEditLoading) {
              return const CircularProgressIndicator();
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
                      icon: const Icon(Icons.save))
                ],
              );
            } else {
              return const SizedBox();
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
                return const EditorFilterImagePage();
              }
              if (state is PaintOnImagePage) {
                return const Text(
                  "Не успел разобраться(",
                  style: TextStyle(color: Colors.white),
                );
              }
              return Container();
            },
          ),
          BlocBuilder<ImageEditBloc, ImageEditState>(
            builder: (context, state) {
              if (state is ImageEditLoading) {
                return const CircularProgressIndicator();
              }
              if (state is ImageEditReady) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<NavigationImageEditorBloc>()
                              .add(const PageTapped(index: 0));
                          setState(() {
                            activeIndex = 0;
                          });
                          BlocProvider.of<ImageEditBloc>(context)
                              .add(CropImage(state.image!));
                        },
                        icon: const Icon(
                          Icons.crop,
                          color: AppColors.appButtons,
                        )),
                    IconButton(
                        onPressed: () async {
                          context
                              .read<NavigationImageEditorBloc>()
                              .add(const PageTapped(index: 1));

                          setState(() {
                            activeIndex = 1;
                          });
                        },
                        icon: const Icon(Icons.filter,
                            color: AppColors.appButtons)),
                    IconButton(
                        onPressed: () {
                          context
                              .read<NavigationImageEditorBloc>()
                              .add(const PageTapped(index: 2));
                          setState(() {
                            activeIndex = 2;
                          });
                        },
                        icon: const Icon(Icons.edit,
                            color: AppColors.appButtons)),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
