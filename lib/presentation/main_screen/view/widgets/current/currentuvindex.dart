
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';

class CurrentUxIndex extends GetView<MainScreenController> {
  const CurrentUxIndex({super.key});

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
                    'UV index'.tr,
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
                        Container(
                          child: Text(
                            '${controller.current.uv}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,),
                          ),
                        ),
                        Container(
                          child: Text(
                            '${controller.classifyUVIndex(controller.current.uv)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
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