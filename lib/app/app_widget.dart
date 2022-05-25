import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_text_styles.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1000,
        minWidth: 440,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(440, name: MOBILE),
          ResponsiveBreakpoint.resize(600, name: TABLET),
          ResponsiveBreakpoint.resize(750, name: 'BIGTABLET')
        ],
      ),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF8F8F8),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color(0xffF8F8F8),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 10,
            selectedIconTheme: const IconThemeData(color: Color(0xff2F3E77)),
            selectedLabelStyle: AppTextStyles.navBarSelected,
            selectedItemColor: const Color(0xff2F3E77),
            unselectedItemColor: const Color(0xffA2A9B0),
            unselectedLabelStyle: AppTextStyles.navBarUnselected,
          )),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
