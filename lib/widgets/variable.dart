import 'package:fitpage/constants/text_styles.dart';
import 'package:fitpage/functions/string_splitter.dart';
import 'package:fitpage/screens/indicator_screen.dart';
import 'package:fitpage/screens/value_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariableWidget extends StatelessWidget {
  const VariableWidget({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    List m = stringSplitter(text: data["text"]);
    print(m);
    return RichText(
      text: TextSpan(
          children: List.generate(m.length, (i) {
        if (m[i].contains("\$")) {
          return textSpanWidget(text: m[i]);
        } else {
          return TextSpan(text: m[i], style: AppTextStyles.heading);
        }
      })),
    );
  }

  textSpanWidget({required String text}) {
    final String val = appendValue(valData: data["variable"][text], text: text);

    return TextSpan(
      text: val,
      style: AppTextStyles.heading
          .copyWith(color: Colors.blue, decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          switch (data["variable"][text]["type"]) {
            case "value":
              Get.to(ValueScreen(
                valueList: data["variable"][text]["values"],
              ));
            case "indicator":
              Get.to(IndicatorScreen(indicatorData:  data["variable"][text]));
          }
        },
    );
  }

  appendValue({required Map valData, required String text}) {
    if (valData["type"] == "value") {
      return (valData["values"][int.parse(text.replaceAll("\$", "")) - 1])
          .toString();
    } else if (valData["type"] == "indicator") {
      return valData["default_value"].toString();
    }
  }
}
