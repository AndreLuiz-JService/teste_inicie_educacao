import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/start/start_store.dart';
import 'package:flutter/material.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_images.dart';
import 'package:teste_inicie_educacao/app/shared/core/appcolors.dart';
import 'pages/favoritos_page.dart';
import 'pages/home/home_page.dart';
import 'pages/minha_conta_page.dart';

class StartPage extends StatefulWidget {
  final int index;
  const StartPage({Key? key, this.index = 0}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {

  final StartStore store = Modular.get();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    store.setInitalIndex(widget.index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: AppColors.backGrounColor,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              color: AppColors.primaryBlue,
            )),
        title: SizedBox(
          width: 90,
          child: Image.asset(AppImages.inicie_logo),
        ),
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(right: 25),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(AppImages.userImage))),
          ),
        ],
      ),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: store.pageViewController,
          children: [
            HomePage(
              store: store,
            ),
            const FavoritosPage(),
            const MinhaContaPage()
          ]),
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
