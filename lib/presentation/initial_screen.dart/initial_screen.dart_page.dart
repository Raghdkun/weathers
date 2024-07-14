import 'package:weather_app/core/app_export.dart';
import './initial_screen.dart_controller.dart';

class InitialScreenPage extends GetWidget<InitialScreenController> {
  const InitialScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            width: Get.width - 100,
            height: Get.height / 4.5,
            child: Column(
              children: [
                Text(
                  "Welcome to".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  "Vortex Weather",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2),
            width: Get.width - 100,
            height: Get.height / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Card(
              child: PageView(
                controller: controller.pageController,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          // height: .v,
                          child: Image.asset(
                            ImageConstant.logo,
                            height: 230.h,
                          ),
                        ),
                        Text(
                          "Stay up-to-date on the latest weather conditions with our real-time updates."
                              .tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                        ),
                        Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.pageController.animateToPage(1,
                                    duration: Durations.extralong3,
                                    curve: Curves.easeIn);
                              },
                              child: Text("Next".tr),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blue.shade800)),
                            )),
                      ],
                    ),
                  ),
                  //next page
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80.v,
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 100,
                          ),
                        ),
                        Text(
                          "Get personalized recommendations based on your location and interests."
                              .tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                        ),
                        Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.pageController.animateToPage(2,
                                    duration: Durations.extralong3,
                                    curve: Curves.easeIn);
                              },
                              child: Text("Next".tr),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blue.shade800)),
                            )),
                      ],
                    ),
                  ),
                  //next page
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80.v,
                          child: Icon(
                            Icons.notifications,
                            size: 100,
                          ),
                        ),
                        Text(
                          "Stay informed about the latest weather conditions, so you can plan your day accordingly.".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                        ),
                        Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.pageController.animateToPage(3,
                                    duration: Durations.extralong3,
                                    curve: Curves.easeIn);
                              },
                              child: Text("Next".tr),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blue.shade800)),
                            )),
                      ],
                    ),
                  ),
                  //next page
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80.v,
                          child: Icon(
                            Icons.done,
                            size: 100,
                          ),
                        ),
                        Text(
                          "All set ${Emojis.hand_ok_hand}".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                        // Text(
                        //   "Enjoy ${Emojis.hand_love_you_gesture}",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(fontSize: 30),
                        // ),
                        Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.goToHomePage();
                              },
                              child: Text("Done".tr),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blue.shade800)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
