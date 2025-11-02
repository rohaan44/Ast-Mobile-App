import 'dart:math';
import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/plans/trainning_plan/training_plan_view.dart';
import 'package:ast_official/feature/coach_dashboard/plans_royalties/payments_royalties_controller.dart';
import 'package:ast_official/ui_molecules/graphs&chart/payments_grapgh';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentsRoyaltiesView extends StatelessWidget {
  const PaymentsRoyaltiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PaymentsRoyaltiesController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            children: [
              SizedBox(height: ch(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AssetUtils.backArrow),
                  ),
                  AppText(
                    txt: "Pagamenti e Royalties",
                    color: AppColor.white,
                    fontSize: AppFontSize.f19 + 2,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox.shrink()
                ],
              ),
              SizedBox(height: ch(25)),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 Overview
                      activityCard(
                        isGradient: true,
                        padding: const EdgeInsets.all(0),
                        child: Padding(
                          padding: EdgeInsets.all(cw(14)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    txt: "Panoramica Sui Guadagni",
                                    color: AppColor.white,
                                    fontSize: AppFontSize.f16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: cw(90),
                                    height: ch(28),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: cw(5), vertical: ch(8)),
                                    decoration: BoxDecoration(
                                      color: AppColor.red,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          txt: "Fino a: \$${controller.bonus}",
                                          color: AppColor.white,
                                          fontSize: AppFontSize.f14 + 2,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SvgPicture.asset(
                                          AssetUtils.arrowForward,
                                          color: AppColor.white,
                                          width: cw(3),
                                          height: ch(7),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: ch(15)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AppText(
                                    txt:
                                        "\$${controller.totalEarnings.toStringAsFixed(2)}",
                                    textStyle: TextStyle(
                                        fontSize: AppFontSize.f24 + 8,
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.w500,
                                        shadows: const [
                                          Shadow(
                                            blurRadius: 5,
                                            color: Color(0xff34C759),
                                            offset: Offset.zero,
                                          ),
                                          Shadow(
                                            blurRadius: 20.0,
                                            color: Color(0xff34C759),
                                            offset: Offset.zero,
                                          ),
                                        ]),
                                  ),
                                  AppText(
                                    txt: controller.currency,
                                    color: AppColor.white.withOpacity(0.7),
                                    fontSize: AppFontSize.f15,
                                  ),
                                ],
                              ),
                              AppText(
                                txt: " Questo Mese",
                                color: AppColor.white.withOpacity(0.7),
                                fontSize: AppFontSize.f15,
                              ),
                              SizedBox(height: ch(15)),
                              const MyAreaChart(),
                              SizedBox(height: ch(10)),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.c1E1E1E,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(cw(12)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          txt: "Ripartizione Delle Royalties",
                                          color: AppColor.white,
                                          fontSize: AppFontSize.f16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        AppText(
                                          txt: "Nutrizione 30%",
                                          color:
                                              AppColor.white.withOpacity(0.7),
                                          fontSize: AppFontSize.f15,
                                        ),
                                      ],
                                    ),
                                    progressRing(
                                        percent: controller.royaltyPercent),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ch(6)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppText(
                          txt: "Last Payout: ${controller.lastPayoutDate}",
                          color: AppColor.white.withOpacity(0.5),
                          fontSize: AppFontSize.f15,
                        ),
                      ),

                      SizedBox(height: ch(25)),

                      sectionHeader("Transazioni la Storia", onViewAll: () {
                        Navigator.pushNamed(context, RoutePaths.transactionHistoryScreen);
                      }),
                      SizedBox(height: ch(15)),
                      activityCard(
                          child: Column(
                        children: [
                          ...controller.transactions.map((t) {
                            final color = t["amount"] > 0
                                ? const Color(0xff34C759)
                                : t["status"] == "Fallito"
                                    ? const Color(0xffFF3A2F)
                                    : const Color(0xff34C759);
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: cw(15), vertical: ch(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            txt: t["title"],
                                            color: AppColor.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: AppFontSize.f16,
                                          ),
                                          SizedBox(
                                            height: ch(10),
                                          ),
                                          AppText(
                                            txt: t["subtitle"],
                                            color:
                                                AppColor.white.withOpacity(0.6),
                                            fontSize: AppFontSize.f15,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          AppText(
                                            txt:
                                                "${t["amount"] > 0 ? "+" : ""}\$${t["amount"].abs()}",
                                            color: color,
                                            fontSize: AppFontSize.f16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: ch(5)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: cw(10),
                                                vertical: ch(3)),
                                            decoration: BoxDecoration(
                                              color: color,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: AppText(
                                              txt: t["status"],
                                              color: AppColor.white,
                                              fontSize: AppFontSize.f15 + 1,
                                              fontWeight: FontWeight.w600,
                                            ),
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
                                )
                              ],
                            );
                          })
                        ],
                      )),
                      // Transactions

                      SizedBox(height: ch(25)),
   sectionHeader("Abbonamento Atlete", onViewAll: () {
       Navigator.pushNamed(context, RoutePaths.athleteSubscriptionsScreen);
   }),
    SizedBox(height: ch(15)),
                      activityCard(
                          child: Column(
                        children: [
                          ...controller.subscriptions.map((s) {
                            final color = s["status"] == "Attivo" ||
                                    s["status"] == "Attiva"
                                ?const Color(0xff34C759)
                                : s["status"] == "Annullata"
                                    ?const Color(0xffFF3A2F)
                                    : const Color(0xffFF8D28);

                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: cw(15), vertical: ch(20)),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: cw(18),
                                        backgroundColor: AppColor.c252525,
                                        child: AppText(
                                          txt: s["name"][0],
                                          color: AppColor.white,
                                          fontSize: AppFontSize.f20,
                                        ),
                                      ),
                                      SizedBox(width: cw(12)),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              txt: s["name"],
                                              color: AppColor.white,
                                              fontSize: AppFontSize.f16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: ch(10),),
                                            AppText(
                                              txt: s["type"],
                                              fontSize: AppFontSize.f15,
                                              color: AppColor.white
                                                  .withOpacity(0.6),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          AppText(
                                            txt: "\$${s["amount"]}/mo",
                                            color: Colors.greenAccent,
                                            fontWeight: FontWeight.w600,
                                            fontSize: AppFontSize.f16,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: ch(5)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: cw(10),
                                                vertical: ch(3)),
                                            decoration: BoxDecoration(
                                              color: color,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: AppText(
                                              txt: s["status"],
                                              color: Colors.white,
                                              fontSize: AppFontSize.f15 + 1,
                                              fontWeight: FontWeight.w600,
                                            ),
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
                                )
                              ],
                            );
                          })
                        ],
                      )),
                     
                      SizedBox(height: ch(40)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionHeader(String title, {required VoidCallback onViewAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          txt: title,
          color: AppColor.white,
          fontSize: AppFontSize.f19,
          fontWeight: FontWeight.w600,
        ),
        GestureDetector(
          onTap: onViewAll,
          child: AppText(
            txt: "Visualizza tutto >",
            color: AppColor.red,
            fontSize: AppFontSize.f15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget progressRing({required double percent, double size = 54}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ProgressPainter(percent),
        child: Center(
          child: AppText(
            txt: "${percent.toInt()}%",
            color: AppColor.white,
            fontSize: AppFontSize.f15,
          ),
        ),
      ),
    );
  }
}

// Chart painter
// class _LineChartPainter extends CustomPainter {
//   final List<double> data;
//   _LineChartPainter(this.data);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.greenAccent
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;

//     final path = Path();
//     for (int i = 0; i < data.length; i++) {
//       final x = (size.width / (data.length - 1)) * i;
//       final y = size.height - (data[i] / 12 * size.height);
//       if (i == 0) {
//         path.moveTo(x, y);
//       } else {
//         path.lineTo(x, y);
//       }
//     }

//     canvas.drawPath(path, paint);
//     for (int i = 0; i < data.length; i++) {
//       final x = (size.width / (data.length - 1)) * i;
//       final y = size.height - (data[i] / 12 * size.height);
//       canvas.drawCircle(Offset(x, y), 3, Paint()..color = Colors.greenAccent);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

class _ProgressPainter extends CustomPainter {
  final double percent;
  _ProgressPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()
      ..color = Colors.grey.shade800
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    final fg = Paint()
      ..color = AppColor.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 3;

    canvas.drawCircle(center, radius, bg);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi * (percent / 100), false, fg);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
