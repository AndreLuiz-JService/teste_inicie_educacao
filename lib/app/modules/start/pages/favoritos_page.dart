import 'package:flutter/material.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_text_styles.dart';
import 'package:teste_inicie_educacao/app/shared/core/appcolors.dart';

class FavoritosPage extends StatefulWidget {
  final String title;
  const FavoritosPage({Key? key, this.title = 'FavoritosPage'}) : super(key: key);
  @override
  FavoritosPageState createState() => FavoritosPageState();
}
class FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Text('Tela Favoritos',style: AppTextStyles.blue18pxw700,),
              ),
            )
          ],
        ),
      ),
    );
  }
}