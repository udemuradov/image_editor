import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsart/src/config/blocs/providers.dart';
import 'package:picsart/src/config/routes/app_routes.dart';
import 'package:picsart/src/config/themes/app_themes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PicsArt',
        theme: AppTheme.picsart,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        onUnknownRoute: AppRoutes.onUnkownRoute,
      ),
    );
  }
}
