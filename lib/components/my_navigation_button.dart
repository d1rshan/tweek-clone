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
        padding: EdgeInsets.all(8),
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Color.fromRGBO(190, 156, 243, 1),
        ),
        child: Text(
          'DP',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
