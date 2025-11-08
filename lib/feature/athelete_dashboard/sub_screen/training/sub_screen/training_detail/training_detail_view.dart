import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/athelete_dashboard/sub_screen/training/sub_screen/training_detail/training_detail_controller.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TrainingDetailView extends StatelessWidget {
  final String title;
  final String subTitle;
  final String difficultyLevel;
  final String cardImg;
  final String date;

  const TrainingDetailView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.difficultyLevel,
    required this.date,
    required this.cardImg,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerSection(
                    context: context,
                    title: title,
                    subTitle: subTitle,
                    difficultyLevel: difficultyLevel,
                    cardImg: cardImg,
                    date: date),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: cw(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        txt: "$subTitle •",
                        fontWeight: FontWeight.w300,
                        fontSize: 28,
                      ),
                      SizedBox(
                        height: ch(28),
                      ),
                      Consumer<TrainingDetailController>(
                          builder: (context, model, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            dynamicWrapListWidget(model.myItems),
                            SizedBox(
                              height: ch(33),
                            ),
                            const Divider(
                              color: AppColor.c1E1E1E,
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            Row(
                              children: [
                                AppText(
                                  txt: "Informazioni su questo programma",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  width: cw(8),
                                ),
                                SvgPicture.asset(AssetUtils.arrowForward),
                              ],
                            ),
                            SizedBox(
                              height: cw(16),
                            ),
                            AppText(
                              txt:
                                  "I Mountain Climbers sono un esercizio cardio dinamico per tutto il corpo che simula il movimento della corsa in posizione plank. Lavorano su core, spalle e gambe, aumentando la frequenza cardiaca. Alternando rapidamente le ginocchia verso il petto, si sviluppano resistenza, coordinazione e stabilità del core, il tutto senza bisogno di attrezzature.",
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: AppColor.cFFFFFF.withOpacity(0.7),
                              maxLines: 3,
                              height: 1.3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: ch(20),
                            ),
                            const Divider(
                              color: AppColor.c1E1E1E,
                            ),
                            SizedBox(
                              height: cw(32),
                            ),
                            categorySelector(model),
                            SizedBox(
                              height: cw(26),
                            ),
                            AppText(
                              txt: "Forma e stabilità del core",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: cw(16),
                            ),
                            AppText(
                              txt:
                                  "Impara l’allineamento corretto del plank e il movimento delle ginocchia",
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: AppColor.cFFFFFF.withOpacity(0.7),
                              maxLines: 3,
                              height: 1.3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: cw(16),
                            ),
                            dynamicWrapListWidget2(model.calList),
                            SizedBox(
                              height: ch(20),
                            ),
                            const Divider(
                              color: AppColor.c1E1E1E,
                            ),
                            postureShape(model: model),
                            SizedBox(
                              height: cw(16),
                            ),
                            AppText(
                              txt: "Progressione",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: cw(28),
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          AssetUtils.circularCheck),
                                      SizedBox(
                                        width: cw(8),
                                      ),
                                      Expanded(
                                        child: AppText(
                                          txt: model.principalList[index],
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          height: 1.2,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: ch(12),
                                  );
                                },
                                itemCount: model.principalList.length),
                            SizedBox(
                              height: ch(36),
                            ),
                            AppText(
                              txt: "Note tecniche",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: ch(36),
                            ),
                            AppText(
                              txt:
                                  "Mantieni una linea retta dalla testa ai talloni",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.2,
                            ),
                            SizedBox(
                              height: ch(12),
                            ),
                            AppText(
                              txt:
                                  "Evita di far cadere o inarcare la parte bassa della\nschiena",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.2,
                            ),
                            SizedBox(
                              height: ch(36),
                            ),
                            AppText(
                              txt: "Indicazioni",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            SizedBox(
                              height: ch(36),
                            ),
                            AppText(
                              txt: "Spingi il pavimento con le mani",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.2,
                            ),
                            SizedBox(
                              height: ch(12),
                            ),
                            AppText(
                              txt:
                                  "Mantieni i fianchi livellati—niente rimbalzi",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.2,
                            ),
                            SizedBox(
                              height: ch(12),
                            ),
                            AppText(
                              txt: "Piedi veloci, core contratto",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.2,
                            ),
                            SizedBox(
                              height: ch(32),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  txt: "Allenatore di allenamento",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.cFFFFFF,
                                  fontSize: 14,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      AppText(
                                        txt: "More",
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.c42A8FF,
                                        fontSize: 14,
                                      ),
                                      SizedBox(
                                        width: cw(8),
                                      ),
                                      SvgPicture.asset(AssetUtils.keyboardArrow)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            postureShape(model: model),
                            SizedBox(
                              height: cw(120),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: ch(20)),
              child: AppButton(
                width: 90.w,
                buttonColor: AppColor.primary,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.trainingComplete,
                  );
                },
                text: "Inizia Allenamento",
                textColor: AppColor.cFFFFFF,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget postureShape({required TrainingDetailController model}) {
  final items = model.nextMealList;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return Container(
              width: 100.w,
              height: ch(66),
              padding: EdgeInsets.symmetric(horizontal: cw(6), vertical: ch(6)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.c171717),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(cw(15)),
                    child: Image.asset(
                      items[index]["img"],
                      height: ch(54),
                      width: cw(54),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: cw(8),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        txt: items[index]["title"] ?? "",
                        fontWeight: FontWeight.w500,
                        color: AppColor.cFFFFFF,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: ch(4),
                      ),
                      AppText(
                        txt: items[index]["time"] ?? "",
                        fontWeight: FontWeight.w400,
                        color: AppColor.cFFFFFF.withOpacity(0.5),
                        fontSize: 10,
                      ),
                      SizedBox(
                        height: ch(5),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AssetUtils.fireIcon,
                            height: ch(12),
                            width: ch(12),
                          ),
                          SizedBox(
                            width: ch(5),
                          ),
                          AppText(
                            txt: items[index]["cals"],
                            fontWeight: FontWeight.w400,
                            color: AppColor.cFFFFFF.withOpacity(0.5),
                            fontSize: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(AssetUtils.playIcon),
                  SizedBox(
                    width: cw(10),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: ch(12),
            );
          },
          itemCount: model.nextMealList.length),
    ],
  );
}

Widget headerSection({
  required BuildContext context,
  required String title,
  required String subTitle,
  required String difficultyLevel,
  required String cardImg,
  required String date,
}) {
  return SizedBox(
    height: ch(358),
    width: 100.w,
    child: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            cardImg,
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.c000000.withOpacity(0),
                  AppColor.c121212,
                ],
              ),
            ),
          ),
        ),

        // 🌟 Foreground Content
        Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ch(50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: ch(40),
                      width: cw(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.cFFFFFF.withOpacity(0.1),
                        border: Border.all(
                          color: AppColor.cFFFFFF.withOpacity(0.2),
                        ),
                      ),
                      child:
                          Center(child: SvgPicture.asset(AssetUtils.backArrow)),
                      //  const Icon(
                      //   Icons.keyboard_arrow_left_rounded,
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: ch(40),
                      width: cw(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.cFFFFFF.withOpacity(0.1),
                        border: Border.all(
                          color: AppColor.cFFFFFF.withOpacity(0.2),
                        ),
                      ),
                      child: Center(child: SvgPicture.asset(AssetUtils.tag)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: cw(6), vertical: ch(8)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cw(50)),
                      color: AppColor.cFFFFFF.withOpacity(0.1),
                    ),
                    child: Center(
                      child: AppText(
                        txt: difficultyLevel,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  SizedBox(width: cw(6)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: cw(6), vertical: ch(8)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cw(50)),
                      color: AppColor.cFFFFFF.withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetUtils.icon2,
                          height: ch(10),
                          width: cw(10),
                          color: Colors.white,
                        ),
                        SizedBox(width: cw(4)),
                        AppText(
                          txt: date,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColor.white,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AssetUtils.playIcon,
                    height: ch(42),
                    width: cw(42),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: ch(12)),
              AppText(
                txt: "$title •",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColor.white,
              ),
              SizedBox(height: ch(20)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget dynamicWrapListWidget(List items) {
  return Wrap(
    spacing: 8, // horizontal gap between items
    runSpacing: 8, // vertical gap between rows
    children: items.map((item) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.c171717,
          borderRadius: BorderRadius.circular(cw(50)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // text ke hisab se size le
          children: [
            if (item['img'] != null) ...[
              SvgPicture.asset(
                item['img'],
                height: ch(14),
                width: cw(14),
                fit: BoxFit.contain,
              ),
              SizedBox(width: cw(8)),
            ],
            AppText(
              txt: item['text'],
              fontSize: 12,
              color: AppColor.cFFFFFF,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      );
    }).toList(),
  );
}

Widget dynamicWrapListWidget2(
  List items,
) {
  return Wrap(
    spacing: 8, // horizontal gap between items
    runSpacing: 8, // vertical gap between rows
    children: items.map((item) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.c171717,
          border: Border.all(color: AppColor.c1E1E1E),
          borderRadius: BorderRadius.circular(cw(12)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // text ke hisab se size le
          children: [
            // if (item['img'] != null) ...[
            //   SvgPicture.asset(
            //     item['img'],
            //     height: ch(14),
            //     width: cw(14),
            //     fit: BoxFit.contain,
            //   ),
            //   SizedBox(width: cw(8)),
            // ],
            AppText(
              txt: item['label'],
              fontSize: 12,
              color: item["color"],
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      );
    }).toList(),
  );
}

Widget categorySelector(dynamic model) {
  return Container(
    height: ch(50),
    color: AppColor.background,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ListView.builder(
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.horizontal,
      itemCount: model.categories.length,
      itemBuilder: (context, index) {
        final label = model.categories[index]['label'];
        return _buildChip(label, index, model);
      },
    ),
  );
}

Widget _buildChip(String label, int index, dynamic model) {
  final bool isSelected = model.selectedCategoryIndex == index;

  return InkWell(
    onTap: () {
      model.setSelectedCategory(index);
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColor.c252525,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: AppText(
          txt: label,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColor.cFFFFFF,
        ),
      ),
    ),
  );
}
