import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_course_section/tutor_course_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_profile_settings_section/tutor_profile_settings_section.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_submission_section/tutor_submission_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/ui_molecules/bottombar/tutor_bottombar/tutor_bottombar.dart';
import 'package:ast_official/ui_molecules/bottombar/tutor_bottombar/tutor_bottombar_controller.dart';
import 'package:ast_official/feature/tutor_dashboard/home_screen/tutor_home_screen_view.dart';

// class TutorMainScreen extends StatelessWidget {
//   const TutorMainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TutorBottomBar(),
//       child: const _TutorMainBody(),
//     );
//   }
// }

class TutorMainScreen extends StatelessWidget {
  const TutorMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorBottomBar>(context);

    return Scaffold(
      body: PageView(
        controller: model.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => model.setSelectedIndex(index),
        children: const [
          // index 0 - 4
          TutorHomeScreenView(),
          TutorCourseSectionView(),
          TutorSubmissionSectionView(),
          TutorProfileSettingsSectionView(),
        ],
      ),
      bottomNavigationBar: tutorBottomBar(),
    );
  }
}
