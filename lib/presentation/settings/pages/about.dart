import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/settings/settings_controller.dart';

class About extends GetView<SettingsController> {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("About".tr),
          ),
          SliverToBoxAdapter(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        title: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("App name".tr),
                              Text("Vortex Weather"),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Version".tr),
                              Text("1.0.0"),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          controller.lanchurl("https://www.weatherapi.com/");
                        },
                        title: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Data Source".tr),
                              Text("WeathersApi")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Made with ${Emojis.emotion_blue_heart} by",
                  textDirection: TextDirection.ltr,
                ),
                TextButton(
                    onPressed: () {
                      controller
                          .lanchurl("https://www.instagram.com/raghdkun/");
                    },
                    child: Text(
                      "@Raghdkun",
                      textDirection: TextDirection.ltr,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
