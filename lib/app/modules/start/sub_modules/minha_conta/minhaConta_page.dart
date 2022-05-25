import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/minha_conta/minhaConta_store.dart';
import 'package:flutter/material.dart';

class MinhaContaPage extends StatefulWidget {
  final String title;
  const MinhaContaPage({Key? key, this.title = 'MinhaContaPage'}) : super(key: key);
  @override
  MinhaContaPageState createState() => MinhaContaPageState();
}
class MinhaContaPageState extends State<MinhaContaPage> {
  final MinhaContaStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}