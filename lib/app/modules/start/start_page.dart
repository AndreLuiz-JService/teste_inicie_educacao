import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/start/start_store.dart';
import 'package:flutter/material.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_images.dart';
import 'package:teste_inicie_educacao/app/shared/core/appcolors.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key? key, this.title = 'StartPage'}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGrounColor,
        title: SizedBox(
          width: 90,
          child: Image.asset(AppImages.inicie_logo),
        ),
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          currentIndex: store.indexPage,
          onTap: (index) {
            if (index != store.indexPage) {
              store.setindexPage(index);
            }
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                width: 25,
                child: Image.asset(
                  AppImages.icone_home,
                  color: AppColors.primaryBlue,
                ),
              ),
              icon: SizedBox(
                width: 25,
                child: Image.asset(AppImages.icone_home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                width: 25,
                child: Image.asset(
                  AppImages.icone_favorite,
                  color: AppColors.primaryBlue,
                ),
              ),
              icon: SizedBox(
                width: 25,
                child: Image.asset(AppImages.icone_favorite),
              ),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                width: 25,
                child: Image.asset(
                  AppImages.icone_peson,
                  color: AppColors.primaryBlue,
                ),
              ),
              icon: SizedBox(
                width: 25,
                child: Image.asset(AppImages.icone_peson),
              ),
              label: 'Minha conta',
            ),
          ],
        );
      }),
    );
  }
}
