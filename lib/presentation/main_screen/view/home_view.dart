import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/core/utils/handlingdataview.dart';
import 'package:weather_app/presentation/main_screen/view/widgets/forecast/forcastdaywidget.dart';

import '../controller/main_screen_controller.dart';
import 'widgets/current/currenthumitity.dart';
import 'widgets/current/currentpressure.dart';
import 'widgets/current/currentuvindex.dart';
import 'widgets/current/currentwind.dart';
import 'widgets/current/todaywidget.dart';
import 'widgets/forecast/widgets/humidity.dart';
import 'widgets/forecast/widgets/precipitation.dart';
import 'widgets/forecast/widgets/wind.dart';

class HomeView extends GetWidget<MainScreenController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.toggleAnimation();
    return GetBuilder<MainScreenController>(
      init: MainScreenController(),
      builder: (controller) => Scaffold(
          // backgroundColor: controller.getDayColor(controller.current.isDay),
          body: HandlingDataView(
        statusRequest: controller.loadDataState,
        widget: RefreshIndicator(
          onRefresh: () async {
            await controller.refreshPage();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                toolbarHeight: 65,
                surfaceTintColor:
                    controller.getDayColor(controller.current.isDay),
                title: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 15.h,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(4289842175).withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            radius: 20,
                            child: IconButton(
                              icon: Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 22,
                              ),
                              onPressed: () {
                                Get.toNamed(AppRoutes.selectcountry);
                              },
                            )),
                        Container(
                          child: controller.location.region != ""
                              ? Text(
                                  "${controller.location.region}",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              : Text("${controller.location.name}",
                                  style: TextStyle(fontSize: 18)),
                        ),
                        CircleAvatar(
                          radius: 20,
                          child: IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.settings);
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 22,

                              // size: 27.h,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              SliverToBoxAdapter(
                child: FadeIn(
                  duration: Duration(milliseconds: 1500),
                  delay: Duration(milliseconds: 2000),
                  child: Column(
                    children: [
                      FadeIn(
                          duration: Duration(milliseconds: 1500),
                          delay: Duration(milliseconds: 2300),
                          child: TodayWidget()),
                      SizedBox(
                        height: 50,
                      ),
                      Transform.translate(
                        offset: Offset(0, -30),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              children: [
                                Text("Forecast days".tr),
                                ...List.generate(
                                  controller.forecastdayList.length,
                                  (index) => ForcastDayWidget(
                                      forecastday:
                                          controller.forecastdayList[index],
                                      date: controller
                                          .forecastdayList[index].date!),
                                ),
                                Align(
                                  child: Text(
                                    "Forecast Hours".tr,
                                  ),
                                ),
                                FadeIn(
                                  duration: Duration(milliseconds: 2000),
                                  delay: Duration(milliseconds: 2000),
                                  child: Card(
                                    elevation: 4,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(children: [
                                        ...List.generate(
                                          controller.ForecastHoursList.length,
                                          (index) => FadeInRightBig(
                                            duration:
                                                Duration(milliseconds: 2000),
                                            delay: Duration(milliseconds: 2000),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        "${controller.gethours(controller.ForecastHoursList[index].time)}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 13.h,
                                                        )),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                        width: 50.h,
                                                        child: SvgPicture.asset(
                                                          // ignore: deprecated_member_use
                                                          color: Get.isDarkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                          '${controller.gotImage(controller.ForecastHoursList[index].condition!.icon, "${controller.ForecastHoursList[index].isDay.toString()}")}',
                                                          height: 40.h,
                                                        )),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "${controller.ForecastHoursList[index].tempC!.toInt()}º",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                                FadeIn(
                                  duration: Duration(milliseconds: 1500),
                                  delay: Duration(milliseconds: 2500),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Current Condtion".tr,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CurrentWind(),
                                          CurrentHumidity(),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CurrentPressure(),
                                          CurrentUxIndex()
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                FadeIn(
                                  duration: Duration(milliseconds: 1500),
                                  delay: Duration(milliseconds: 2700),
                                  child: Column(
                                    children: [
                                      Align(
                                        // alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Astronomical information".tr,
                                        ),
                                      ),
                                      Card(
                                        elevation: 4,
                                        // color: controller.getDayColor(
                                        //     controller.current.isDay),
                                        child: Container(
                                            decoration: BoxDecoration(

                                                // color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            height: Get.height / 5,
                                            width: Get.width,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            '${"Sunrise".tr} \n ${controller.astro.sunrise}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                // color:
                                                                //     Colors.white,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            '${"Sunset".tr} \n ${controller.astro.sunset}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                // color:
                                                                //     Colors.white,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            '${"Moonrise".tr} \n ${controller.astro.moonrise}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                // color:
                                                                //     Colors.white,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            '${"Moonset".tr} \n ${controller.astro.moonset}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                // color:
                                                                //     Colors.white,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                    "${"Moon Phase".tr} ${controller.getTranslateItMoonPhase(controller.astro.moonPhase)}")
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FadeIn(
                                  duration: Duration(milliseconds: 1500),
                                  delay: Duration(milliseconds: 3000),
                                  child: Card(
                                    elevation: 4,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    controller.comIndex = 0;
                                                    controller.update();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: controller
                                                                .comIndex ==
                                                            0
                                                        ? Color(4289842175)
                                                            .withOpacity(0.4)
                                                        : null,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child:
                                                      Text("Precipitation".tr)),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    controller.comIndex = 1;
                                                    controller.update();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: controller
                                                                .comIndex ==
                                                            1
                                                        ? Color(4289842175)
                                                            .withOpacity(0.4)
                                                        : null,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: Text("Wind".tr)),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    controller.comIndex = 2;

                                                    controller.update();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: controller
                                                                .comIndex ==
                                                            2
                                                        ? Color(4289842175)
                                                            .withOpacity(0.4)
                                                        : null,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: Text("Humidity".tr)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        controller.changeContanerindex(
                                            Precipitation(),
                                            Wind(),
                                            Humidity()),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // SliverToBoxAdapter(
              //   child: Container(
              //     decoration: BoxDecoration(),
              //   ),
              // ),
            ],
          ),
        ),
      )),
    );
  }
}



// make an index for all widgets bellow and

