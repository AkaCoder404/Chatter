import 'package:flutter/material.dart';

import '../constants.dart';

class AvatarWithActiveIndicator extends StatelessWidget {
  const AvatarWithActiveIndicator({
    Key? key,
    this.image,
    this.radius = 24,
    this.isActive,
  }) : super(key: key);

  final String? image;
  final double? radius;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 47,
          width: 47,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: new Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: new DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.topCenter,
                    image: AssetImage(image!),
                  )),
            ),
          ),
        ),

        // ClipRRect(
        //   borderRadius: BorderRadius.circular(5),

        //   child: Container(
        //     child: Image(
        //       image: AssetImage(image!),
        //     ),
        //     height: 48,
        //     width: 48,
        //   ),
        // ),
        // CircleAvatar(
        //   radius: radius,
        //   backgroundImage: AssetImage(image!),
        // ),
        if (isActive!)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: primaryColor,
                // shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor, width: 3),
              ),
            ),
          )
      ],
    );
  }
}
