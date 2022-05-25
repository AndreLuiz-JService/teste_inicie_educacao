

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_fade/image_fade.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_images.dart';
import 'package:teste_inicie_educacao/app/shared/core/appcolors.dart';

import '../../shared/core/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isTablet = ResponsiveWrapper.of(context).isTablet;
    final bool isBigTablet = ResponsiveWrapper.of(context).equals('BIGTABLET');
    double widthImage() {
      return size.width;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * 0.05,
                        child: SizedBox(
                            width: 120,
                            child: Image.asset(AppImages.inicie_logo)),
                      ),
                      Positioned(
                        top: size.height * 0.12,
                        left: size.width * 0.25,
                        child: SizedBox(
                            width: widthImage() * 0.2,
                            child: Image.asset(AppImages.back_bools)),
                      ),
                      Positioned(
                        top: isTablet ? size.height * 0.42 : size.height * 0.37,
                        right: size.width * 0.08,
                        child: SizedBox(
                            width: widthImage() * 0.28,
                            child: Image.asset(AppImages.back_bools)),
                      ),
                      Positioned(
                        top: size.height * 0.12,
                        right: size.width * 0.02,
                        child: SizedBox(
                            width: widthImage() * 0.6,
                            child: Image.asset(AppImages.fundo_pikachu)),
                      ),
                      Positioned(
                        top: size.height * 0.09,
                        right: size.width * 0,
                        child: SizedBox(
                            width: widthImage() * 0.55,
                            child: const ImageFade(
                              image:
                                  AssetImage(AppImages.pikachu_splash_page),
                              duration: Duration(milliseconds: 2000),
                              curve: Curves.bounceIn,
                            )),
                      ),
                      Positioned(
                        top: size.height * 0.16,
                        left: size.width * 0.00,
                        child: SizedBox(
                            width: widthImage() * 0.38,
                            child: Image.asset(AppImages.fundo_togepi)),
                      ),
                      Positioned(
                        top: size.height * 0.14,
                        left: size.width * 0.03,
                        child: SizedBox(
                            width: widthImage() * 0.33,
                            child: const ImageFade(
                              image:
                                  AssetImage(AppImages.togepi_splash_page),
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.bounceIn,
                            )),
                      ),
                      Positioned(
                        top: size.height * 0.33,
                        left: size.width * 0.05,
                        child: SizedBox(
                            width: widthImage() * 0.55,
                            child: Image.asset(AppImages.fundo_bulbassauro)),
                      ),
                      Positioned(
                        top: size.height * 0.31,
                        left: size.width * 0.12,
                        child: SizedBox(
                            width: widthImage() * 0.5,
                            child: const ImageFade(
                              image:
                                  AssetImage(AppImages.bulbassauro_splash_page),
                              duration: Duration(milliseconds: 1500),
                              curve: Curves.bounceIn,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Explore o mundo\n',
                  style: AppTextStyles.titlesplashBlue,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'dos ', style: AppTextStyles.titlesplashBlue),
                    TextSpan(
                        text: 'Pokémons', style: AppTextStyles.titlesplashRed),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Descubra todas as espécies de Pokémons',
                style: AppTextStyles.subtitleSplash,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: (){
                  Modular.to.pushReplacementNamed('/start/home/');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: AppColors.primaryRed,
                            offset: const Offset(0, 4))
                      ]),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 40),
                  width: size.width * 0.6,
                  height: isBigTablet ? 60 : isTablet ? 50 :45,
                  child: Row(
                    children: [
                      const Expanded(
                          child: SizedBox(
                        width: 40,
                      )),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Continuar',
                          style: AppTextStyles.white18pxw700,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
