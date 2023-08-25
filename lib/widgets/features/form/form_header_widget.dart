import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    this.textAlign,
    this.height = 0.2,
    this.heightBetween = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  final double height;
  final double heightBetween;
  final String image;
  final String title;
  final String subtitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: screenHeight * height,
        ),
        SizedBox(
          height: heightBetween,
        ),
        Text(title, style: Theme.of(context).textTheme.displayMedium),
        Text(subtitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
