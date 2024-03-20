import 'package:fitpage/constants/text_styles.dart';
import 'package:flutter/material.dart';

class IndicatorScreen extends StatelessWidget {
  IndicatorScreen({super.key, required this.indicatorData});
  final Map indicatorData;
  final TextEditingController _indicatorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _indicatorController.text = indicatorData["default_value"].toString();
    print(_indicatorController.text);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              indicatorData["study_type"],
              style: AppTextStyles.heading,
            ),
            Text(
              "Set Paramaters",
              style: AppTextStyles.heading.copyWith(fontWeight: FontWeight.w600),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
           
              child: Wrap(
                children: [
                  Text(
                    indicatorData["parameter_name"],
                    style: AppTextStyles.heading.copyWith(color: Colors.black),
                  ),
                  TextField(
                    controller: _indicatorController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(5)))),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
