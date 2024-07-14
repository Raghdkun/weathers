import 'package:animate_do/animate_do.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';
import 'package:weather_app/presentation/main_screen/model/weathermodel.dart';

class ForcastDayWidget extends GetView<MainScreenController> {
  final Forecastday forecastday;
  final String date;
  const ForcastDayWidget({
    super.key,
    required this.forecastday,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      duration: Duration(milliseconds: 1500),
      delay: Duration(milliseconds: 2500),
      child: Card(
        child: Container(
          // height: 50,
          child: ExpandablePanel(
            theme: ExpandableThemeData(
                inkWellBorderRadius: BorderRadius.circular(10),
                iconColor: Get.isDarkMode ? Colors.white : Colors.black38),
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Text(
                "${controller.getDayname(date)}",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
            collapsed: Container(),
            expanded: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    Container(
                      // width: Get.width / 1.1,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(4289842175).withOpacity(0.2)),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // width: 120,
                                // padding: const EdgeInsets.symmetric(horizontal: 5),

                                child: Text(
                                  'UV index'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${forecastday.day!.uv}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${controller.classifyUVIndex(controller.current.uv)}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              // BoxedIcon(
                              //   controller.getMoonPhaseIcon(
                              //       "${forecastday.astro!.moonPhase}"),
                              //   size: 82,
                              // ),
                              // SizedBox(
                              //   height: 2,
                              // ),
                              // // SizedBox(
                              // //   height: 10,
                              // // ),
                              // Text("Moon phase:"),

                              // Text("${forecastday.astro!.moonPhase}"),

                              // BoxedIcon(WeatherIcons.moon_third_quarter, size: 80,),
                            ],
                          ),
                          Column(
                            // mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${controller.translateStatus(forecastday.day!.condition!.text)}",
                                          // textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "${forecastday.day!.mintempC}º/${forecastday.day!.maxtempC}º",
                                          // textAlign: TextAlign.center,
                                        ),
                                        SvgPicture.asset(
                                          '${controller.gotforecastImage(forecastday.day!.condition!.icon.toString())}',
                                          height: 35.h,
                                          // ignore: deprecated_member_use
                                          color: Get.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Container(
                      // height: Get.height / 6.5,
                      // width: Get.width / 1.2,
                      margin: EdgeInsets.all(5),

                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(4289842175).withOpacity(0.2)),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text(
                                'Humidity'.tr,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                //calculated container for humidity percentage
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 50,
                                    width: 30,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(4289842175),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    height: 50 *
                                        controller.convertHumidity(
                                            forecastday.day!.avghumidity),
                                    width: 30,
                                  ),
                                ],
                              ),
                              Text(
                                '${forecastday.day!.avghumidity}%',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                          Column(
                            children: [
                              Text(
                                "Average temp:".tr,
                                textAlign: TextAlign.center,
                              ),
                              Text("${forecastday.day!.avgtempC}º"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Wind speed:".tr),
                              Row(
                                children: [
                                  Text("${forecastday.day!.maxwindKph}"),
                                  Text("km".tr),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    )
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8),
                    //   child: Divider(),
                    // ),
                    // Row(
                    //   children: [
                    //     List.generate(controller.forecastdayList.l, (index) => null)
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  Text("${controller.getDayname(date)}"),
