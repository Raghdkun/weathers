import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';

class CurrentHumidity extends GetView<MainScreenController> {
  const CurrentHumidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // color: controller.getDayColor(
      //     controller.current.isDay),
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(16)),
        // height: Get.height / 6,
        width: Get.width / 2.3,
        child: Column(
          // mainAxisAlignment:
          //     MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Humidity'.tr,
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
                    Column(
                      children: [
                        Text(
                          '${controller.humidity}%',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0, -15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('100'),
                          Stack(
                            //calculated container for humidity percentage
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                height: 50,
                                width: 30,
                              ),
                              AnimatedContainer(
                                curve: Curves.decelerate,
                                duration: Duration(seconds: 1),
                                decoration: BoxDecoration(
                                    color: Color(4289842175),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                height: 50 *
                                    controller
                                        .convertHumidity(controller.humidity),
                                width: 30,
                              ),
                            ],
                          ),
                          Text('0'),
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
