import 'package:flutter/material.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_text_styles.dart';

class MinhaContaPage extends StatefulWidget {
  final String title;
  const MinhaContaPage({Key? key, this.title = 'MinhaContaPage'}) : super(key: key);
  @override
  MinhaContaPageState createState() => MinhaContaPageState();
}
class MinhaContaPageState extends State<MinhaContaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Text('Tela Minha Connta',style: AppTextStyles.blue18pxw700,),
              ),
            )
          ],
        ),
      ),
    );
  }
}