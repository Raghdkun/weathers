import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/settings/settings_controller.dart';

class NotificationSettings extends GetView<SettingsController> {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Notifications".tr),
          ),
          SliverToBoxAdapter(
            child: GetBuilder<SettingsController>(
              builder: (controller) => Container(
                // padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Notifications status".tr),
                          Switch(
                            value: controller.activeNotification,
                            onChanged: (value) {
                              controller.activeNotification = value;
                              controller.notificationsSwitcher(value);
                              controller.update();
                            },
                          ),
                        ],
                      ),
                    ),
                    controller.activeNotification == true
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Notifications timer".tr),
                                DropdownButton<int>(
                                  value: controller
                                      .notificationsTimer, // Initial selected value
                                  elevation: 16,
                                  onChanged: (newValue) {
                                    controller.notificationsTimer = newValue!;
                                    controller.submitMenu(newValue);
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  items: [
                                    DropdownMenuItem<int>(
                                        value: 30, child: Text("half hour".tr)),
                                    DropdownMenuItem<int>(
                                        value: 60, child: Text("hour".tr)),
                                    DropdownMenuItem<int>(
                                        value: 180, child: Text("3 hours".tr)),
                                    DropdownMenuItem<int>(
                                        value: 360, child: Text("6 hours".tr)),
                                    DropdownMenuItem<int>(
                                        value: 1440, child: Text("day".tr)),
                                    // Add more items as needed
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


// Container(
//                       child: ExpandablePanel(
//                         header: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 14, vertical: 8),
//                           child: Text(
//                             "Notifications status",
//                             style: TextStyle(fontSize: 16),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                         collapsed: Column(
//                           children: [
//                             ListTile(
//                               trailing: Icon(Icons.done),
//                               onTap: () {},
//                               title: Text("enabled"),
//                             ),
//                             ListTile(
//                               trailing: Icon(Icons.done),
//                               onTap: () {},
//                               title: Text("disabled"),
//                             ),
//                           ],
//                         ),
//                         expanded: Container(),
//                         theme: ExpandableThemeData(
//                             inkWellBorderRadius: BorderRadius.circular(10),
//                             iconColor:
//                                 Get.isDarkMode ? Colors.white : Colors.black38),
//                       ),
//                     ),
