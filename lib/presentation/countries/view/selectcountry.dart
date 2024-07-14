import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/core/utils/handlingdataview.dart';
import 'package:weather_app/presentation/countries/controller/countries_controller.dart';

import '../model/countriesmodel.dart';

class SelectCountry extends GetWidget<CountriesController> {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: GlobalKey(),
        body: GetBuilder<CountriesController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.loadDataState,
                  widget: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        leading: Container(),
                        bottom: PreferredSize(
                          preferredSize: Size(60, 55),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Select the city from your location".tr),
                                    // SizedBox(width: 10,),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          // color: Get.isDarkMode ? Colors.white : Colors.black,
                                          ),
                                      child: Card(
                                        child: InkWell(
                                            onTap: () =>
                                                controller.findUserLocation(),
                                            child:
                                                Icon(Icons.location_searching)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          AnimationSearchBar(
                            // backIconColor: Colors.white,
                            centerTitle: 'Choose Your Country'.tr,
                            hintText: "search here..".tr,
                            searchIconColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            isBackButtonVisible: true,
                            backIconColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            searchTextEditingController:
                                controller.textController,
                            // searchIconColor: Colors.white,
                            closeIconColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            searchFieldDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                    style: BorderStyle.none)),
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              // color: Colors.white
                            ),
                            hintStyle: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            centerTitleStyle: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              // color: Colors.white
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            horizontalPadding: 12,
                            onChanged: (text) {
                              // text = controller.textController.text ;
                              controller.searchAndUpdate(text);
                            },
                          )
                        ],
                      ),
                      HandlingDataView(
                          statusRequest: controller.loadDataState,
                          widget: SliverToBoxAdapter(
                            child: controller.searchList.isNotEmpty
                                ? Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: ListView.builder(
                                      // physics: ScrollPhysics(parent: ),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          CountiesWidget(
                                              controller.searchList[index]),
                                      itemCount: controller.searchList.length,
                                    ),
                                  )
                                : controller.data.isNotEmpty
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: ListView.builder(
                                          // physics: ScrollPhysics(parent: ),
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),

                                          itemBuilder: (context, index) =>
                                              CountiesWidget(
                                                  controller.data[index]),
                                          itemCount: controller.data.length,
                                        ),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator()),
                          ))
                    ],
                  ),
                )));
  }
}

class CountiesWidget extends GetView<CountriesController> {
  final CountriesModel countriesModel;
  // final int index ;
  const CountiesWidget(this.countriesModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToCitiesPage(countriesModel);
      },
      child: Container(
        height: 70.h,
        // width: Get.width ,
        // alignment: Alignment.center,
        child: Card(
          // margin: EdgeInsets.symmetric(
          //   horizontal: 8,
          // ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                    height: 60.h,
                    width: 45.v,
                    child: Image.asset(
                        '${ImageConstant.flags}/${countriesModel.iso2!.toLowerCase()}.png',
                        fit: BoxFit.contain)),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "${countriesModel.country}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 15.v),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
