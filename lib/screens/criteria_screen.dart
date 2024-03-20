import 'package:fitpage/constants/app_colors.dart';
import 'package:fitpage/constants/text_styles.dart';
import 'package:fitpage/functions/get_widget.dart';
import 'package:flutter/material.dart';

class CriteriaScreen extends StatelessWidget {
  const CriteriaScreen({super.key, required this.data});
  final Map data;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1886B0),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                data["name"],
                style: AppTextStyles.heading,
              ),
              Text(data["tag"],
                  style: AppTextStyles.subHeading.copyWith(
                    color: AppColors.colorMap[data["color"]],
                  ))
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: data["criteria"].length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.only(top: 20),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    getWidget(widgetData: data["criteria"][index]),
                    index < data["criteria"].length - 1
                        ? Text(
                            "and",
                            style: AppTextStyles.subHeading
                                .copyWith(color: Colors.white),
                          )
                        : const SizedBox()
                  ],
                ),
              );
            }));
  }
}
