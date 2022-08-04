import 'package:flutter/material.dart';

class CloseXButton extends StatelessWidget {
  const CloseXButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0, top: 8.0),
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                  width: 0, color: Colors.transparent)),
          minimumSize: MaterialStateProperty.all<Size>(
              const Size.fromHeight(12)),
          foregroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Align(
          alignment: Alignment.topRight,
          child: Icon(Icons.close, color: Colors.black),
        ),
      ),
    );
  }
}