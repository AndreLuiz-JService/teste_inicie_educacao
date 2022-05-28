import 'package:flutter/material.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_text_styles.dart';

class ItenNavBar extends StatelessWidget {
  final Widget image;
  final String text;
  final VoidCallback ontap;
  const ItenNavBar(
      {Key? key, required this.image, required this.text, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: InkWell(
        onTap: () =>  ontap(),
        child: Column(
          children: [
            SizedBox(
              width: 25,
              child: image,
            ),
            Text(
              text,
              style: AppTextStyles.navBarUnselected,
            )
          ],
        ),
      ),
    );
  }
}
