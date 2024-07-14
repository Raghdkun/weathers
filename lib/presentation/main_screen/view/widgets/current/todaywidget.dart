import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';

class TodayWidget extends GetView<MainScreenController> {
  const TodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Text("Now".tr),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  controller.current.tempC != null
                      ? "${controller.current.tempC!.toInt()}º"
                      : "",
                  style: TextStyle(fontSize: 65),
                ),
                Transform.translate(
                  offset: Offset(0, 5),
                  child: Container(
                      // width: 100.h,

                      child: SvgPicture.asset(
                    // ignore: deprecated_member_use
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    '${controller.gotImage("${controller.conditions.icon}", "${controller.current.isDay.toString()}")}',
                    height: 60.h,
                  )),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      controller.translateStatus(controller.conditionText) ==
                              null
                          ? "${controller.conditionText}"
                          : "${controller.translateStatus(controller.conditionText)}",

                      // style: TextStyle(overflow: TextOverflow.fade,textBaseline: TextBaseline.ideographic),
                    ),
                  ],
                ),
                Opacity(
                  opacity: 0.5,
                  child: Row(
                    children: [
                      Text("feels like: ".tr),
                      Text("${controller.feelslike}º")
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
