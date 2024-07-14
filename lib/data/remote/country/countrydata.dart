import '../../../core/constants/constants.dart';
import '../../apiClient/api_client.dart';

class CountriesData { 
  ApiConnectGet apiConnect;

  CountriesData(this.apiConnect);
//String q
  getData() async {
    var response = await apiConnect.getData(EndPoints.countries,);
    return response.fold((l) => l, (r) => r);
  }
}