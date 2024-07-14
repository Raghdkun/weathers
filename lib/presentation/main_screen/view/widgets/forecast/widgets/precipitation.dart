import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';

class Precipitation extends GetView<MainScreenController> {
  const Precipitation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Today's amount".tr,
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
                  "${controller.forecastdayList[index].day!.totalprecipMm}",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Text(
                "mm".tr,
                style: TextStyle(fontSize: 25),
              ),
              // SizedBox(height: 50,)
            ],
          ),
        ),
        // controller.rainChance == 0 ? Text("No rain expected".tr) : Container(),
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
                                    color: Colors.white.withOpacity(0.1),
                                    // borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 50,
                                  width: 30,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(4289842175)
                                      // color: Get.isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.black,
                                      // borderRadius: BorderRadius.only(
                                      //     bottomLeft: Radius.circular(10),
                                      //     bottomRight: Radius.circular(10))
                                      ),
                                  height: controller.ForecastHoursList[index]
                                              .chanceOfRain!
                                              .toDouble() ==
                                          0
                                      ? 50 * 5 / 100
                                      : 50 *
                                          controller.ForecastHoursList[index]
                                              .chanceOfRain!
                                              .toDouble() /
                                          100,
                                  width: 30,
                                ),
                                // Transform.translate(
                                //     offset: Offset(0, -30),
                                //     child: Column(
                                //       children: [
                                //         1 ==
                                //                 controller
                                //                     .ForecastHoursList[index]
                                //                     .willItSnow
                                //             ? Text(
                                //                 "${controller.ForecastHoursList[index].chanceOfSnow}%")
                                //             : Container(),
                                //         1 ==
                                //                 controller
                                //                     .ForecastHoursList[index]
                                //                     .willItSnow
                                //             ? Container(
                                //                 decoration: BoxDecoration(
                                                  
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             160), ),
                                //                 child: Text(
                                //                     "${Emojis.wheater_snowflake}"),
                                //               )
                                //             : Container(),
                                //       ],
                                //     )),
                              ],
                            ),
                            Text(
                                "${controller.ForecastHoursList[index].chanceOfRain}%"),
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
