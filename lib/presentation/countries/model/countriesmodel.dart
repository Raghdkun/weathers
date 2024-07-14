class CountriesModel {
  String? iso2;
  String? iso3;
  String? country;
  List<String>? cities;

  CountriesModel({this.iso2, this.iso3, this.country, this.cities});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    country = json['country'];
    cities = json['cities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    data['country'] = this.country;
    data['cities'] = this.cities;
    return data;
  }


}
