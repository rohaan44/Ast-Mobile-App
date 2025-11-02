import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      body: SingleChildScrollView(
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
                children: [
                  AppText(
                    txt: "$subTitle .",
                    fontWeight: FontWeight.w300,
                    fontSize: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget headerSection({
  required BuildContext context,
  required String title,
  required String subTitle,
  required String difficultyLevel,
  required String cardImg,
  required String date,
}) {
  return Container(
    height: ch(358),
    width: 100.w,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(cardImg), fit: BoxFit.cover)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: cw(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ch(50),
          ),
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
                      border:
                          Border.all(color: AppColor.cFFFFFF.withOpacity(0.2))),
                  child: const Icon(Icons.keyboard_arrow_left_rounded),
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
                      border:
                          Border.all(color: AppColor.cFFFFFF.withOpacity(0.2))),
                  child: SvgPicture.asset(AssetUtils.tagIcon),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: cw(6), vertical: ch(8)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(cw(50)),
                    color: AppColor.cFFFFFF.withOpacity(0.1)),
                child: Center(
                  child: AppText(
                    txt: difficultyLevel,
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
              ),
              SizedBox(
                width: cw(4),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: cw(6), vertical: ch(8)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(cw(50)),
                    color: AppColor.cFFFFFF.withOpacity(0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetUtils.icon2,
                      height: ch(10),
                      width: cw(10),
                    ),
                    SizedBox(
                      width: cw(4),
                    ),
                    AppText(
                      txt: date,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
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
          AppText(
            txt: "$title .",
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          SizedBox(
            height: ch(20),
          ),
        ],
      ),
    ),
  );
}
