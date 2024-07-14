
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';

class Humidity extends GetView<MainScreenController> {
  const Humidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Today's average".tr,
              ),
            ),
          ],
        ),
        ...List.generate(
          1,
          (index) => Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "${controller.forecastdayList[index].day!.avghumidity}%",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              // SizedBox(height: 50,)
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                height: 100,
              ),
              ...List.generate(
                  controller.ForecastHoursList.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                                  height: controller.ForecastHoursList[index]
                                              .humidity!
                                              .toDouble() ==
                                          0
                                      ? 50 * 5 / 100
                                      : 50 *
                                          controller.ForecastHoursList[index]
                                              .humidity!
                                              .toDouble() /
                                          100,
                                  width: 30,
                                ),
                              ],
                            ),
                            Text(
                                "${controller.ForecastHoursList[index].humidity}%"),
                            Text(
                                "${controller.gethours(controller.ForecastHoursList[index].time)}"),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ))
            ],
          ),
        )
      ],
    );
  }
}
