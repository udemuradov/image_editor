import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsart/src/core/utils/app_colors.dart';
import 'package:picsart/src/presentation/bloc/image_edit/image_edit_bloc.dart';

class EditorFilterImagePage extends StatefulWidget {
  const EditorFilterImagePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditorFilterImagePage> createState() => _EditorFilterImagePageState();
}

class _EditorFilterImagePageState extends State<EditorFilterImagePage> {
  ColorFilter fill = colorFilter.first;
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
        return Column(
          children: [
            SizedBox(
              height: 300,
              child: ColorFiltered(
                colorFilter: fill,
                child: Image.file(
                  state.image!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              children: [
                ...List.from(colorFilter.map((e) {
                  int index = colorFilter.indexOf(e);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        fill = colorFilter[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 4),
                      height: 70,
                      width: 70,
                      child: ColorFiltered(
                          colorFilter: colorFilter[index],
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              state.image!,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  );
                }))
              ],
            )
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
