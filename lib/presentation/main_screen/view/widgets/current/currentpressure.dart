

import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';

class CurrentPressure extends GetView<MainScreenController> {
  const CurrentPressure({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: Get.height / 5.5,
        width: Get.width / 2.3,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Pressure'.tr,
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${controller.current.pressureMb}\n${"Mbar".tr}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
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