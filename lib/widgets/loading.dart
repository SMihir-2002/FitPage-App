
import 'package:fitpage/constants/text_styles.dart';
import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Loading...",
                  style: AppTextStyles.heading
                      .copyWith(color: Colors.green),
                ),
                const CircularProgressIndicator(
                  color: Colors.green,
                )
              ],
            )),
      );
  }
}

