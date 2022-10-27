import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LongRoundedConfirmButton extends StatelessWidget {
  final String buttonText;
  final Function? action;
  const LongRoundedConfirmButton(
    this.buttonText,{this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0, left: 32, top: 0, bottom: 16),
      child: ElevatedButton(
        style: ButtonStyle(
          //maximumSize: MaterialStateProperty.resolveWith((states) => states.any((s) => s==MaterialState.pressed) ? Size.fromHeight(100) : Size.fromHeight(70)),
          minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(36.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.circular(30))),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 24)),
          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(181, 221, 218, 1)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.blue.withOpacity(0.04);
              }
              if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
                return Colors.blue.withOpacity(0.12);
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () { action?.call() ?? 
          GoRouter.of(context).pop();
        },
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'SourceSansProBold'),
        ),
      ),
    );
  }
}
