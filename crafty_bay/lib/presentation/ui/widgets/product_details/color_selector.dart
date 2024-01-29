
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector(
      {super.key, required this.colors, required this.onChanged});

  final List<Color> colors;
  final Function(Color) onChanged;
  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color selectedColor;

  void initState() {
    super.initState();
    selectedColor = widget.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.colors
          .map((c) => InkWell(
                onTap: () {
                  selectedColor = c;
                  widget.onChanged(c);
                  if (mounted) setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                      backgroundColor: c,
                      child: selectedColor == c
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null),
                ),
              ))
          .toList(),
    );
  }
}
