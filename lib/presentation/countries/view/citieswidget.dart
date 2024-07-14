import 'package:weather_app/core/app_export.dart';

import '../controller/cities_controller.dart';

class CitesWidget extends GetWidget<CitiesController> {
  const CitesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('${controller.countriesModel.country}'),
        ),
        body: Container(
            decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: ExactAssetImage(AssetsImages.appBackground),
                //     // opacity: 0.4,
                //     fit: BoxFit.fill),
                // color: Colors.transparent
                ),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: 8,
            ),
            child: ListView.builder(
              itemCount: controller.countriesModel.cities!.length,
              itemBuilder: (context, index) => CitiesList(index),
            )
            // child: Container(child: Text('${controller.countriesModel.cities}'),),
            ),
      ),
    );
  }
}

class CitiesList extends GetView<CitiesController> {
  // final CountriesModel countriesModel;
  final int index;
  const CitiesList(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      child: InkWell(
        onTap: () {
          print("the $index ${controller.countriesModel.cities![index]}");
          // controller.myServices.sharedPreferences.clear(); 
          controller.getcityAndGoTomainScreen(
              "${controller.countriesModel.cities![index]}");
              
        },
        child: Card(
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.location_on, size: 25, color: Color(4289842175),),
              SizedBox(
                width: 10,
              ),
              Text(
                '${controller.countriesModel.cities![index]}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.v),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
