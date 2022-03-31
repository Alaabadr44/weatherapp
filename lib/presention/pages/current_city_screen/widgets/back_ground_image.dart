// back_ground_image
import 'package:flutter/material.dart';

import '../../../components/images.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              imBackgroundImage,
            ),
            fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
