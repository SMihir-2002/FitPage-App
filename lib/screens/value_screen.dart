import 'package:fitpage/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ValueScreen extends StatelessWidget {
  const ValueScreen({super.key, required this.valueList});
  final List valueList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.centerLeft,
            height: 100,
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white))),
            child: Text(
              valueList[index].toString(),
              style: AppTextStyles.heading,
            ),
          );
        },
        itemCount: valueList.length,
      ),
    );
  }
}
