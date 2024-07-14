import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentWind extends GetView<MainScreenController> {
  const CurrentWind({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        // height: Get.height / 6,
        width: Get.width / 2.3,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Wind'.tr,
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Column(
                      children: [
                        Text(
                          '${controller.current.windKph}', //km/h
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Km/h'.tr,
                          // style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0, -15),
                      child: Column(
                        children: [
                          Text(
                            '${controller.windDir}',
                            style: TextStyle(fontSize: 12),
                          ),
                          WindIcon(
                            degree: controller.windDegree,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
