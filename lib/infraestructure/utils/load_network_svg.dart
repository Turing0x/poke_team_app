import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Container loadNetworkSvg( String imageUrl, { double size = 90 } ) {
  return Container(
    padding: const EdgeInsets.only(bottom: 10, right: 10),
    width: size,
    height: size,
    child: SvgPicture.network(imageUrl, 
      placeholderBuilder: (BuildContext context) => const CircularProgressIndicator()));
}