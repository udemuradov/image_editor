import 'package:flutter/material.dart';
import 'package:picsart/src/core/utils/app_colors.dart';
import 'package:picsart/src/presentation/views/home_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        title: const Text('Image Editor'),
        backgroundColor: AppColors.appButtons,
      ),
      body: const HomePage(),
    );
  }
}
