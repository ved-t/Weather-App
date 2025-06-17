/// id : 2801268
/// name : "London"
/// region : "City of London, Greater London"
/// country : "United Kingdom"
/// lat : 51.52
/// lon : -0.11
/// url : "london-city-of-london-grea ter -london-united-kingdom "

class CityInformation {
  CityInformation({
      num? id, 
      String? name ,
      String? region, 
      String? country,
      num? lat, 
      num? lon, 
      String? url,}){
    _id = id;
    _name = name;
    _region = region;
    _country = country;
    _lat = lat;
    _lon = lon;
    _url = url;
}

  CityInformation.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _url = json['url'];
  }
  num? _id;
  String? _name;
  String? _region;
  String? _country;
  num? _lat;
  num? _lon;
  String? _url;
CityInformation copyWith({  num? id,
  String? name,
  String? region,
  String? country,
  num? lat,
  num? lon,
  String? url,
}) => CityInformation(  id: id ?? _id,
  name: name ?? _name,
  region: region ?? _region,
  country: country ?? _country,
  lat: lat ?? _lat,
  lon: lon ?? _lon,
  url: url ?? _url,
);
  num? get id => _id;
  String? get name => _name;
  String? get region => _region;
  String? get country => _country;
  num? get lat => _lat;
  num? get lon => _lon;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['region'] = _region;
    map['country'] = _country;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['url'] = _url;
    return map;
  }
}