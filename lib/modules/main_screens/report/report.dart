
import 'package:calorie_counter/app_config.dart';

import 'package:calorie_counter/modules/main_screens/report/layouts/current_weight.dart';
import 'package:calorie_counter/modules/main_screens/report/layouts/daily_progress.dart';
import 'package:calorie_counter/modules/main_screens/report/report_controller.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      init: ReportController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: CommonAppBar(
            title: Fonts.calorieReport.tr,
            onTap: () => scanTap(),
          ),

          body: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [DailyProgress(), CurrentWeight()],
            ).paddingAll(16),
          ),
        );
      },
    );
  }

  void onTapFunction(ReportController ctrl, title) {
    ctrl.categorySelect(title);
  }

  void scanTap() {
    Get.toNamed(RouteName.scanImage);
  }
}
