
import 'package:fitpage/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorWiget extends StatelessWidget {
  const ErrorWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons
                  .signal_wifi_statusbar_connected_no_internet_4_outlined,
              color: Colors.white,
              size: 100,
            ),
            Text(
              "Something Went Wrong",
              style: AppTextStyles.heading,
            )
          ],
        ),
      );
  }
}