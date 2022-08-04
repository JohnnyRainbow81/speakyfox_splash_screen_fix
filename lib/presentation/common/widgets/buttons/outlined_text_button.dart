import 'package:flutter/material.dart';

class OutlinedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? action;

  const OutlinedTextButton(this.text,{
    Key? key,this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 48,
      child: OutlinedButton(
          onPressed: action ?? (){},
          child: 
          Text(
            text,
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
