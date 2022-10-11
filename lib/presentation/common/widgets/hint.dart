import 'package:flutter/material.dart';
import 'package:speakyfox/presentation/common/resources/color_assets.dart';

class Hint extends StatelessWidget {
  final String text;

  const Hint(this.text,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Container(
              decoration:  BoxDecoration(border: Border.all(width: 1.6,color: ColorAssets.markupGreenDark),
                  /* color: ColorAssets.markupGreenLight,  */borderRadius: BorderRadius.all(Radius.circular(4) )),
              padding: const EdgeInsets.only(left: 16, right: 16),
              child:Row(
                mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style:const TextStyle(color: ColorAssets.markupGreenDark)),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            Icons.check,
            color: ColorAssets.markupGreenDark,
          )
        ],
      ),
     ) );
  }
}
