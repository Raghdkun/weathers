import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/localization/changelocal.dart';
    
class InitialLangPage extends GetView<Changelocal> {

  const InitialLangPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Choose your language".tr),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("English"),
                      // leading: Icon(modeController.getthemeSign(Icons.done)) ,
                      onTap: () {
                        controller.changeLocal("en");
                        Get.offAllNamed(AppRoutes.initialRoute);
                      },
                    ),
                    ListTile(
                      title: Text("العربية"),
                      // leading: Icon(modeController.getthemeSign(Icons.done)) ,
                      onTap: () {
                        // controller.changeTheme("dark");
                        controller.changeLocal("ar");
                
                        Get.offAllNamed(AppRoutes.initialRoute);
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}