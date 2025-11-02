import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/transaction_history/transaction_history_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TransactionsHistoryView extends StatelessWidget {
  const TransactionsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionsHistoryController>();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ch(20)),
            // 🔙 Header
            Padding(
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AssetUtils.backArrow),
                  ),
                  AppText(
                    txt: "Cronologia delle transazioni",
                    color: AppColor.white,
                    fontSize: AppFontSize.f19 + 2,
                    fontWeight: FontWeight.w600,
                  ),
             const SizedBox.shrink(),
                ],
              ),
            ),
        
            SizedBox(height: ch(25)),
        
            // 🔹 Choice Filter List
            SizedBox(
              height: ch(35),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.choiceList.length,
                separatorBuilder: (_, __) => SizedBox(width: cw(10)),
                itemBuilder: (context, index) {
                  final isSelected = controller.selectedChoice == index;
                  return Padding(
                    padding: EdgeInsets.only(left:index==0? cw(20):0, right:index==3? cw(20):0 ),
                    child: GestureDetector(
                      onTap: () => controller.selectChoice(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                            horizontal: cw(12), vertical: ch(5)),
                        decoration: BoxDecoration(
                        
                          color:
                              isSelected ? AppColor.red : AppColor.c1E1E1E.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: AppText(
                            txt: controller.choiceList[index],
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: AppFontSize.f15,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        
            SizedBox(height: ch(20)),
        
            // 🔹 Transactions List
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ...controller.transactions.map((t) {
                      final amountColor = t["amount"] > 0
                          ? const Color(0xff34C759)
                          : const Color(0xffFF3A2F);
        
                      final iconColor = t["status"] == "completed"
                          ? const Color(0xff34C759)
                          : t["status"] == "pending"
                              ? const Color(0xffFF8D28)
                              : const Color(0xffFF3A2F);
        
                      final iconAsset = t["status"] == "completed"
                          ? AssetUtils.checkIcon
                          : t["status"] == "pending"
                              ? AssetUtils.clockIcon
                              : AssetUtils.crossIcon;
        
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: cw(10), vertical: ch(14)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Avatar
                                CircleAvatar(
                                  radius: cw(30),
                                  backgroundColor: AppColor.c252525,
                                  child: AppText(
                                    txt: t["name"][0],
                                    color: AppColor.white,
                                    fontSize: AppFontSize.f20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: cw(12)),
        
                                // Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        txt: t["name"],
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: AppFontSize.f16,
                                      ),
                                      
                                      SizedBox(height: ch(2)),
                                      AppText(
                                        txt: t["title"],
                                        color:
                                            AppColor.white.withOpacity(0.7),
                                        fontSize: AppFontSize.f18,
                                        height: 1.5,
                                      ),
                                      SizedBox(height: ch(5)),
                                      AppText(
                                        txt: t["time"],
                                        color:
                                            AppColor.white.withOpacity(0.5),
                                        fontSize: AppFontSize.f16,
                                      ),
                                    ],
                                  ),
                                ),
        
                                // Amount + Status
                                Row(
                                  children: [
                                    AppText(
                                      txt:
                                          "${t["amount"] > 0 ? "+" : "-"} \$${t["amount"].abs().toStringAsFixed(2)}",
                                      color: amountColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppFontSize.f16,
                                    ),
                                    SizedBox(width: cw(6)),
                                    SvgPicture.asset(
                                      iconAsset,
                                      height: ch(18),
                                      color: iconColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            decoration: const BoxDecoration(
                                gradient: AppGradients.redGradient),
                          ),
                        ],
                      );
                    }),
        
                    SizedBox(height: ch(20)),
        
                    // 🔹 Summary
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: cw(20)),
                      child: activityCard(
                        padding:const EdgeInsets.all(0),
                        isGradient: true,
                        child: Container(
                          alignment: Alignment.center,
                                   
                          padding: EdgeInsets.symmetric(
                              horizontal: cw(16), vertical: ch(14)),
                          decoration: BoxDecoration(
                            color: AppColor.c1E1E1E,
                            // border: Border.all(
                            //     color: AppColor.red.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    txt: "Total Credits",
                                    color: AppColor.white,
                                    fontSize: AppFontSize.f16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: ch(10),),
                                  AppText(
                                    txt:
                                        "+\$${controller.totalCredits.toStringAsFixed(2)}",
                                    color: const Color(0xff34C759),
                                    fontSize: AppFontSize.f18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AppText(
                                    txt: "Total Deduction",
                                    color: AppColor.white,
                                    fontSize: AppFontSize.f16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: ch(10),),
                                  AppText(
                                    txt:
                                        "-\$${controller.totalDeduction.toStringAsFixed(2)}",
                                    color: const Color(0xffFF3A2F),
                                    fontSize: AppFontSize.f18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ch(40)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
