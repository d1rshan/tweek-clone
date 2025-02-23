import 'package:flutter/material.dart';

class MyNavigationButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onTap;

  const MyNavigationButton({
    super.key,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Icon(
          iconData,
          size: 16,
        ),
      ),
    );
  }
}
