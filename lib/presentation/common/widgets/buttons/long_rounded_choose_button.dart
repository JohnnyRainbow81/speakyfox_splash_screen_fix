import 'package:flutter/material.dart';

class LongRoundedButton extends StatefulWidget {
  final String text;

  final Function(Widget) callBack;

  String getText() {
    return text;
  }

  const LongRoundedButton(Key? key, {required this.text, required this.callBack}) : super(key: key);

  @override
  _LongRoundedButtonState createState() => _LongRoundedButtonState();
}

class _LongRoundedButtonState extends State<LongRoundedButton> {
  //var key;  //redundant?
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 24)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(30)),
        backgroundColor: isSelected
            ? MaterialStateProperty.all<Color>(Colors.white)
            : MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: isSelected
            ? MaterialStateProperty.all<Color>(Colors.black)
            : MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(width: 1.0, color: Color.fromRGBO(255, 255, 255, 0.35))),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) return Colors.blue.withOpacity(0.04);
            if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
              return Colors.blue.withOpacity(0.12);
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
          widget.callBack(widget);
        });
      },
      child: Text(
        widget.text,
        style: const TextStyle(fontFamily: 'SourceSansProBold', fontSize: 14),
      ),
    );
  }
}
