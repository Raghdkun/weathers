import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:weather_app/core/app_export.dart';

class NotificationServices {
  // init awesome notifications
  static Future<void> initializeNotifications() async {
    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        // You can specify multiple notification channels.
        [
          // Notification channel for basic notifications
          NotificationChannel(
              channelGroupKey: 'high_importance_channel_group',
              channelKey: 'high_importance_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Color(0xFF9D50DD),
              ledColor: Colors.white,
              channelShowBadge: true,
              groupKey: "high_importance_channel_group",
              enableLights: true,
              importance: NotificationImportance.Max),
          // Notification channel for urgent notifications
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          // Notification channel group for basic notifications
          NotificationChannelGroup(
            channelGroupKey: 'high_importance_channel_group',
            channelGroupName: 'group 1',
          ),
        ],
        debug: true);

    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod);
  }

  static Future givePermissions() async {
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    final payload = receivedAction.payload ?? {};
    if (payload['navigate'] == "true") {
      // Get.put(MainScreenController());
      // Navigate to the main screen instead of SplashScreen
      // MyApp.navigatorKey.currentState?.pushNamed('/');
      Get.offAllNamed(AppRoutes.splashscreen);
    }
  }

  static Future<String> selectitle(String title, String artitle) async {
    // set ar title and body
    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("lang") == "en") {
      return title;
    } else {
      return artitle;
    }
  }

  static Future<String> selecbody(String body, String arbody) async {
    // set ar title and body
    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("lang") == "en") {
      return body;
    } else {
      return arbody;
    }
  }

// recieve notification in forground mode example for a call or something like that.
  static Future<void> forgroundNotification(
      {required final String title,
      required final String artitle,
      required final String body,
      required final String arbody,
      final String? summary,
      final Map<String, String>? payload,
      final ActionType actionType = ActionType.Default,
      final NotificationLayout notificationLayout = NotificationLayout.Default,
      final NotificationCategory? category,
      final String? bigPicture,
      final List<NotificationActionButton>? actionButton,
      final int? interval,
      final String icon = "",
      final bool repeat = false}) async {
    AndroidForegroundService.startAndroidForegroundService(
      foregroundStartMode: ForegroundStartMode.notStick,
      foregroundServiceType: ForegroundServiceType.none,
      content: NotificationContent(
        id: 10,
        channelKey: 'high_importance_channel',
        wakeUpScreen: true,
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: category,
        payload: payload,
        bigPicture: bigPicture,
        groupKey: "high_importance_channel_group",
        displayOnBackground: true,
        icon: icon,
        // displayOnBackground: true
      ),
      actionButtons: actionButton,
    );
  }

// method for get All Active Notification Ids On StatusBar
  static Future<void> groupNotification() async {
    await AwesomeNotifications().getAllActiveNotificationIdsOnStatusBar();
  }

// receive normal notifications customized for everything.
  static Future<void> showNotification(
      {required final String title,
      required final String artitle,
      required final String body,
      required final String arbody,
      final String? summary,
      final Map<String, String>? payload,
      final ActionType actionType = ActionType.Default,
      final NotificationLayout notificationLayout = NotificationLayout.Default,
      final NotificationCategory? category,
      final String? bigPicture,
      final List<NotificationActionButton>? actionButton,
      final bool scheduled = false,
      final int? interval,
      final String icon = "",
      final bool repeat = false}) async {
    assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'high_importance_channel',
          wakeUpScreen: true,
          title: title,
          body: body,
          actionType: actionType,
          notificationLayout: notificationLayout,
          summary: summary,
          category: category,
          payload: payload,
          bigPicture: bigPicture,
          groupKey: "high_importance_channel_group",
          displayOnBackground: true,
          icon: icon,
          // displayOnBackground: true
        ),
        actionButtons: actionButton,
        schedule: scheduled
            ? NotificationInterval(
                interval: interval,
                timeZone:
                    await AwesomeNotifications().getLocalTimeZoneIdentifier(),
                preciseAlarm: true,
                repeats: repeat,
              )
            : null,
        localizations: {
          "en": NotificationLocalization(
            title: title,
            body: body,
          ),
          "ar": NotificationLocalization(
            title: artitle,
            body: arbody,
          ),
        });
  }
}
