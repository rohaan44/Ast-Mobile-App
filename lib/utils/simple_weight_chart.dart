import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SimpleWeightChart extends StatefulWidget {
  const SimpleWeightChart({super.key});

  @override
  State<SimpleWeightChart> createState() => _SimpleWeightChartState();
}

class _SimpleWeightChartState extends State<SimpleWeightChart> {
  final List<double> weights = [1.2, 1.0, 0.8, 0.5, 1.3, 1.0, 1.1];
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ch(14)),
      decoration: BoxDecoration(
        color: AppColor.c1E1E1E,
        borderRadius: BorderRadius.circular(cw(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          AppText(
            txt: "Weight",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                txt: "Your weight progress within a month",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColor.cFFFFFF.withOpacity(0.5),
              ),
              Container(
                height: ch(26),
                width: cw(26),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.c252525),
                    color: AppColor.transparent),
                child: Center(child: SvgPicture.asset(AssetUtils.arrowUp)),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Chart bars
          SizedBox(
            // height: ch(height),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(weights.length, (index) {
                final isTouched = touchedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      touchedIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: 25,
                        height: weights[index] * 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              isTouched ? AppColor.primary : AppColor.c252525,
                          // gradient: LinearGradient(
                          //   colors: isTouched
                          //       ? [AppColor.cFF383C, Colors.orangeAccent]
                          //       : [Colors.grey.shade700, Colors.grey.shade800],
                          //   begin: Alignment.bottomCenter,
                          //   end: Alignment.topCenter,
                          // ),
                        ),
                      ),
                      SizedBox(height: ch(8)),
                      isTouched
                          ? Container(
                              height: ch(6),
                              width: cw(6),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primary),
                            )
                          : Text(
                              [
                                "Mon",
                                "Tue",
                                "Wed",
                                "Thu",
                                "Fri",
                                "Sat",
                                "Sun"
                              ][index],
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                    ],
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 16),

          // Footer info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "82 ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.cFFFFFF,
                      )),
                  TextSpan(
                      text: "kg",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.cFFFFFF.withOpacity(0.7),
                      )),
                ]),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: "80% ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.cFF8D28,
                      )),
                  TextSpan(
                      text: "Completed",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.cFFFFFF,
                      )),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
