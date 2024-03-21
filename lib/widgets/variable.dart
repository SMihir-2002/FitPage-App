import 'package:fitpage/constants/text_styles.dart';
import 'package:fitpage/functions/string_splitter.dart';
import 'package:fitpage/screens/indicator_screen.dart';
import 'package:fitpage/screens/value_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VariableWidget extends StatelessWidget {
  const VariableWidget({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    List textArray = stringSplitter(text: data["text"]);
    return RichText(
      text: TextSpan(
          children: List.generate(textArray.length, (i) {
        if (textArray[i].contains("\$")) {
          return textSpanWidget(text: textArray[i], context: context);
        } else {
          return TextSpan(text: textArray[i], style: AppTextStyles.heading);
        }
      })),
    );
  }

  textSpanWidget({required String text, required BuildContext context}) {
    final String val = appendValue(valData: data["variable"][text], text: text);

    return TextSpan(
      text: val,
      style: AppTextStyles.heading
          .copyWith(color: Colors.blue, decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          switch (data["variable"][text]["type"]) {
            case "value":
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ValueScreen(
                          valueList: data["variable"][text]["values"],
                        )),
              );

            case "indicator":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IndicatorScreen(indicatorData: data["variable"][text])),
              );
            
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
