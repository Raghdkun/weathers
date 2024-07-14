import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/theme/changetheme.dart';

class ChangeMode extends GetWidget<Changetheme> {
  const ChangeMode({super.key});

  @override
  Widget build(BuildContext context) {
    // SettingsController modeController = Get.put(SettingsController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Change theme mode".tr),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Card(
                  child: GetBuilder<Changetheme>(
                builder: (controller) => Column(
                  children: [
                    ListTile(
                      title: Text("Light"),
                      onTap: () {
                        controller.changeTheme("light");
                        // Get.offAllNamed(AppRoutes.homeview);
                      },
                    ),
                    ListTile(
                      title: Text("Dark"),
                      onTap: () {
                        controller.changeTheme("dark");
                        // Get.offAllNamed(AppRoutes.homeview);
                      },
                    ),
                  ],
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
