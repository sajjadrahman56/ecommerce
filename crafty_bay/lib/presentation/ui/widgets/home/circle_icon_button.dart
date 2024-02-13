import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: CircleAvatar(
        // radius: 15,
        backgroundColor: Colors.grey.shade200,
        child: Icon(
          iconData,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
