import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentAmountButton extends StatelessWidget {
  final String amount;

  const PaymentAmountButton(this.amount,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              width: 1,
              color: Color.fromARGB(255, 170, 209, 206),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(44)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
        onPressed: () {
          GoRouter.of(context).pop();
        },
        child: Text(
          '$amount €',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
