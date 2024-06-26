import 'package:fitpage/constants/app_colors.dart';
import 'package:fitpage/constants/text_styles.dart';
import 'package:fitpage/screens/criteria_screen.dart';
import 'package:fitpage/services/app_api.dart';
import 'package:fitpage/widgets/error_state.dart';
import 'package:fitpage/widgets/loading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.mockData});
  final List mockData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isErrorState = false;

  List data = [];

  bool isLoading = true;

  getData() async {
    if (widget.mockData.isEmpty) {
      isLoading = true;
      if (isErrorState == true) {
        setState(() {
          isErrorState = false;
        });
      }
      try {
        var res = await AppApis().getData();
        if (res.statusCode == 200) {
          data = res.data;
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        setState(() {
          isErrorState = true;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      data = widget.mockData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () {
        getData();
        return Future(() => true);
      },
      child: isErrorState
          ? const ErrorWiget()
          : SafeArea(
              child: isLoading
                  ? const LoadingState()
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CriteriaScreen(
                                          data: data[index],
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 100,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.white,
                            ))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index]["name"],
                                  style: AppTextStyles.heading,
                                ),
                                Text(
                                  data[index]["tag"],
                                  style: AppTextStyles.subHeading.copyWith(
                                      color: AppColors
                                          .colorMap[data[index]["color"]]),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
            ),
    ));
  }
}
