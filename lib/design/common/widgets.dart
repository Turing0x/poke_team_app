import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget customText(String text, double? fontSize,
    {FontWeight? fontWeight = FontWeight.normal,
    TextAlign? textAlign = TextAlign.left,
    Color? color = Colors.black,
    int? maxLines,
    bool underline = false}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    style: TextStyle(
      decoration: (underline) ? TextDecoration.underline : null,
      fontFamily: 'Dosis',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign,
  );
}

void customToast(String msg, {bool type = false}) => Fluttertoast.showToast(
  backgroundColor: type ? Colors.green[400] : Colors.red[400],
  msg: msg,
  toastLength: Toast.LENGTH_LONG,
);

Widget boldLabel(String texto, String another, double? fontSize,
    {Color? color = Colors.black}) {
  return RichText(
    text: TextSpan(
      // Here is the explicit parent TextStyle
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
        fontFamily: 'Dosis',
      ),
      children: <TextSpan>[
        TextSpan(
            text: texto, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: another),
      ],
    ),
  );
}
