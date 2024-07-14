
import 'package:weather_app/core/app_export.dart';

handlingData(response){
  if (response is LoadDataState){
   return response ; 
  }else {
   return LoadDataState.initialize ; 
  }
}