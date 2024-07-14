import 'package:animate_do/animate_do.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/splashscreen/controller/splashscreen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      body: Stack(
        
        children: [
          Align(
            alignment: Alignment.center,
            child: ZoomIn(
              child: BounceInDown(
                  // delay: const Duration(seconds: 2),
                  duration: const Duration(seconds: 3),
                  child: Image.asset(
                    ImageConstant.logo,
                    height: 260.h,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: Get.height / 3.1,
              ),
              child: ZoomIn(
                child: ZoomOut(
                  duration: const Duration(seconds: 3),
                    delay: const Duration(seconds: 3),

                  child: ZoomOut(
                    delay: const Duration(seconds: 3),
                    child: Text(
                      'Vortex Weather',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     margin: EdgeInsets.only(
          //       bottom: Get.context!.mediaQueryPadding.bottom + 25,
          //     ),
          //     child: FadeIn(
          //         child: const Text(
          //       'Version 1.0.0',
          //       style: TextStyle(fontSize: 17),
          //     )),
          //   ),
          // )
        ],
      ),
    );
  }
}
