import 'package:easy_bills/2_application/core/services/theme_service.dart';
import 'package:easy_bills/2_application/features/user_profile/screens/screen_create_update_user_profile.dart';
import 'package:easy_bills/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (
      context,
      themeService,
      child,
    ) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        home: const ScreenCreateUpdateUserProfile(),
      );
    });
  }
}
