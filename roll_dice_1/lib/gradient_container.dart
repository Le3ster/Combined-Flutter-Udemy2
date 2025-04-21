import 'package:flutter/material.dart';
import 'package:roll_dice_1/dice_roller.dart';

/// Defines default alignment for the gradient background.
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

/// A stateless widget that renders a gradient background and shows a dice roller.
///
/// Use `GradientContainer.purple()` for a predefined purple/indigo gradient.
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  /// Named constructor for a preset purple gradient.
  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}

// Alternative version using a dynamic color list and StyledText widget.
// This is currently not used, but can be repurposed for flexible gradients.
/*
class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText('Hello World!'),
      ),
    );
  }
}
*/
