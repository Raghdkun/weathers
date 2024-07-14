import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/settings/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Settings'),),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("Settings".tr),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  title: Text("Notifications".tr),
                  leading: Icon(Icons.notifications),
                  onTap: () {
                    Get.toNamed(AppRoutes.notifications);
                  },
                ),
                ListTile(
                  title: Text("Change city".tr),
                  leading: Icon(Icons.location_on),
                  onTap: () {
                    Get.toNamed(AppRoutes.selectcountry);
                  },
                ),
                ListTile(
                  title: Text("Language".tr),
                  leading: Icon(Icons.language),
                  onTap: () {
                    Get.toNamed(AppRoutes.changelang);
                  },
                ),
                ListTile(
                  title: Text("Theme mode".tr),
                  leading: Icon(Icons.mode),
                  onTap: () {
                    Get.toNamed(AppRoutes.changemode);
                  },
                ),
                ListTile(
                  title: Text("About".tr),
                  leading: Icon(Icons.info),
                  onTap: () => Get.toNamed(AppRoutes.about),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
