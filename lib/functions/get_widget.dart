 import 'package:fitpage/widgets/plain_text.dart';
import 'package:fitpage/widgets/variable.dart';
import 'package:flutter/material.dart';

getWidget({required Map widgetData}) {
    switch (widgetData["type"]) {
      case "plain_text":
        return PlainText(text: widgetData["text"]);
      case "variable":
        return VariableWidget(data: widgetData);
      default:
        return Container();
    }
  }