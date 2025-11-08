import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/home_screen/sub_screen/dinner_time/dinner_time_controller.dart';

import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DinnerTimeView extends StatelessWidget {
  const DinnerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ch(50),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left logo
                      GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () =>  Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // small tap area
              child: SvgPicture.asset(
                AssetUtils.backArrow,
                height: ch(20),
                width: cw(20),
              ),
            ),
          ),
                SizedBox(
                    width: cw(158), child: customSlider(5, 5, AppColor.white)),
                Container(
                  width: cw(57),
                  height: ch(26),
                  decoration: BoxDecoration(
                      color: AppColor.c252525,
                      borderRadius: BorderRadius.circular(cw(20))),
                  child: Center(
                    child: AppText(
                      txt: "5 of 5",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.cFFFFFF,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ch(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  txt: "Di solito, a che ora cena?",
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.cFFFFFF,
                  height: 1.5,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: ch(107),
            ),
            SizedBox(
              height: ch(240),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<DinnerTimeController>(
                          builder: (context, dobProvider, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // --- DAY PICKER ---
                            SizedBox(
                              width: cw(70),
                              child: ListWheelScrollView.useDelegate(
                                physics: const FixedExtentScrollPhysics(),
                                itemExtent: ch(40),
                                perspective: 0.008,
                                diameterRatio: 2.5,
                                onSelectedItemChanged: (index) {
                                  dobProvider.setSelectedHour(index);
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: dobProvider.hours.length,
                                  builder: (context, index) => Center(
                                    child: AppText(
                                      txt: dobProvider.hours[index],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: cw(120),
                              child: ListWheelScrollView.useDelegate(
                                physics: const FixedExtentScrollPhysics(),
                                itemExtent: ch(40),
                                perspective: 0.008,
                                diameterRatio: 2.5,
                                onSelectedItemChanged: (index) {
                                  dobProvider.setSelectedMinute(index);
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: dobProvider.minutes.length,
                                  builder: (context, index) => Center(
                                    child: AppText(
                                      txt: dobProvider.minutes[index],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AppText(
                              txt: "PM",
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: ch(45),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppButton(
                buttonColor: AppColor.primary,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      RoutePaths.yourPersonalizedPlanView, (route) => false);
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: (context) {
                  //     return Container(
                  //       height: ch(346),
                  //       decoration: BoxDecoration(
                  //           color: AppColor.c252525,
                  //           borderRadius: BorderRadius.only(
                  //               topRight: Radius.circular(cw(33)),
                  //               topLeft: Radius.circular(cw(33)))),
                  //       child: Column(
                  //         children: [
                  //           SizedBox(
                  //             height: ch(8),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Container(
                  //                 width: cw(60),
                  //                 height: ch(4),
                  //                 decoration: BoxDecoration(
                  //                     color: AppColor.c2D2D2D,
                  //                     borderRadius: BorderRadius.circular(5)),
                  //               ),
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             height: ch(32),
                  //           ),
                  //           AppText(
                  //             txt:
                  //                 "Personalizzazione della tua esperienza\nAST...",
                  //             fontSize: AppFontSize.f20,
                  //             fontWeight: FontWeight.w500,
                  //             color: AppColor.cFFFFFF,
                  //             height: 1.5,
                  //             textAlign: TextAlign.center,
                  //           ),
                  //           SizedBox(
                  //             height: ch(44),
                  //           ),
                  //           SizedBox(
                  //             height: ch(94),
                  //             width: cw(94),
                  //             child: CircularProgressIndicator(
                  //               strokeWidth: cw(9),
                  //               strokeCap: StrokeCap.round,

                  //               color: AppColor.primary,
                  //               backgroundColor: AppColor.c2D2D2D,
                  //               // progressColor: AppColor.primary,))
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: ch(44),
                  //           ),
                  //           AppText(
                  //             txt:
                  //                 "Tieniti forte! Stiamo creando un piano\npersonalizzato solo per te.",
                  //             fontSize: AppFontSize.f16,
                  //             fontWeight: FontWeight.w400,
                  //             color: AppColor.cFFFFFF.withOpacity(0.5),
                  //             height: 1,
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // );
                },
                text: "Avanti",
                fontSize: 16,
                textColor: AppColor.cFFFFFF,
                fontWeight: FontWeight.w600),
            SizedBox(
              height: ch(32),
            )
          ],
        ),
      ),
    );
  }
}
