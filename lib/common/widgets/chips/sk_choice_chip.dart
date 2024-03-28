import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKChoiceChip extends StatelessWidget {
  const SKChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = SKHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: SKHelperFunctions.getColor(text) != null
            ? const SizedBox()
            : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? SKColors.white : null),
        avatar: isColor
            ? SKCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: SKHelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: SKHelperFunctions.getColor(text),
      ),
    );
  }
}
