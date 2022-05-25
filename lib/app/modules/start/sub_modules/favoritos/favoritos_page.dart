import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicie_educacao/app/modules/start/sub_modules/favoritos/favoritos_store.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  final String title;
  const FavoritosPage({Key? key, this.title = 'FavoritosPage'}) : super(key: key);
  @override
  FavoritosPageState createState() => FavoritosPageState();
}
class FavoritosPageState extends State<FavoritosPage> {
  final FavoritosStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}