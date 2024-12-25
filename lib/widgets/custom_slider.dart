import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final String sliderLable, sliderNewValueText;
  final double sliderInitValue, min, max;
  final int divisions;
  final Function(double)? onChanged;
  const CustomSlider(
      {super.key,
      required this.sliderLable,
      required this.sliderInitValue,
      required this.min,
      required this.max,
      required this.divisions,
      required this.onChanged,
      required this.sliderNewValueText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                      text: sliderLable,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: sliderNewValueText,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
          ),
          Slider(
              min: min,
              max: max,
              divisions: divisions,
              value: sliderInitValue,
              onChanged: onChanged),
        ],
      ),
    );
  }
}
