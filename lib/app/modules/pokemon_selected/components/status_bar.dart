
import 'package:flutter/material.dart';
import 'package:teste_inicie_educacao/app/shared/core/app_text_styles.dart';

class StatusBar extends StatelessWidget {
  final int status;
  final String name;
  final Color cor;
  const StatusBar(
      {Key? key, required this.status, required this.name, required this.cor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 90,
            child: Text(
              name,
              style: AppTextStyles.blue12pxw600,
            )),
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final percentColor = (maxWidth / 230) * status;
            return Container(
              height: 8,
              width: maxWidth,
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: percentColor,
                  decoration: BoxDecoration(
                    color: cor,
                    borderRadius: BorderRadius.circular(2)
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(width: 30,)
      ],
    );
  }
}
