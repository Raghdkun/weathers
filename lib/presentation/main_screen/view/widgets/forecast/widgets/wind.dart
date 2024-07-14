
import 'dart:math';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';
import 'package:weather_icons/weather_icons.dart';

class Wind extends GetView<MainScreenController> {
  const Wind({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Today's high".tr,
              ),
            ),
          ],
        ),
        ...List.generate(
          1,
          (index) => Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  "${controller.forecastdayList[index].day!.maxwindKph}",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Text(
                  "Km/h".tr,
                  style: TextStyle(fontSize: 25),
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
                            Transform.rotate(
                              angle: controller
                                      .ForecastHoursList[index].windDegree!
                                      .toDouble() *
                                  pi /
                                  180,
                              child: Icon(
                                WeatherIcons.wind,
                                size: 33,
                                color: Color(4289842175),
                              ),
                            ),
                            Text(
                                "${controller.ForecastHoursList[index].windKph}", textAlign: TextAlign.center,),
                            Text(
                                "${controller.gethours(controller.ForecastHoursList[index].time)}"),
                          ],
                        ),
                      ))
            ],
          ),
        ),
        // SizedBox(
        //   height: 15,
        // ),
      ],
    );
  }
}
