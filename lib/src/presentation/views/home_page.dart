import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picsart/src/core/utils/app_colors.dart';
import 'package:picsart/src/presentation/bloc/image_edit/image_edit_bloc.dart';
import 'package:picsart/src/presentation/views/navigation_image_editor_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? galleryImg = File(image.path);
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          BlocProvider.of<ImageEditBloc>(context).add(UpdateImage(galleryImg));
          return const NavigationImageEditorPage();
        }));
      });
    } catch (e) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton.icon(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                  label: const Text('Добавить из галереи',
                      style: TextStyle(color: AppColors.appText)),
                  icon: const Icon(
                    Icons.perm_media_rounded,
                    color: AppColors.appButtons,
                  )),
            ),
            Expanded(
              flex: 1,
              child: TextButton.icon(
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                  },
                  label: const Text('Сделать снимок',
                      style: TextStyle(color: AppColors.appText)),
                  icon: const Icon(Icons.add_a_photo_rounded,
                      color: AppColors.appButtons)),
            ),
          ],
        ),
        const Text('Recent Images'),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: 1)),
        )
      ],
    );
  }
}
