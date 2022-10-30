// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';

// class EditorCropImagePage extends StatefulWidget {
//   final File image;
//   const EditorCropImagePage({Key? key, required this.image}) : super(key: key);

//   @override
//   State<EditorCropImagePage> createState() => _EditorCropImagePageState();
// }

// class _EditorCropImagePageState extends State<EditorCropImagePage> {
//   // CroppedFile? _croppedFile;
//   // @override
//   // void initState() async {
//   //   await

//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//         onPressed: () async {
//           await cropImage(image: widget.image);
//         },
//         child: Text('crop'));
//   }

//   Future<File?> cropImage({required File image}) async {
//     CroppedFile? croppedFile = await ImageCropper().cropImage(
//       sourcePath: widget.image.path,
//     );
//     if (croppedFile == null) return null;
//     return File(croppedFile.path);
//   }
// }
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
                      return Center(
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
                      return Text('some error');
                    }
                  },
                );
   }
 }