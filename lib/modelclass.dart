class Datatest {

 Info? info;
 List<Result> results = [];
 Name? name;
 Datatest({
  this.info,
  this.results = const [],
  this.name
});
 factory Datatest.fromjson (Map<String , dynamic> jsonData){
  return Datatest(

   results: jsonData['results'] != null ? Result.list1(jsonData['results']):[],
   info: jsonData['info'] != null ? Info.fromjson(jsonData['info']):null,
  );
 }
}

class Info{
 int page = 0;
 String results = "";
 String version = "";
 Info({
  this.page= 0
 });
 factory Info.fromjson(Map<String , dynamic> jsonData){
  return Info(
   page: jsonData['page']
  );
 }
}
class Result {
 String gender = "";
 Name? name;
 Location? location;
 Result({this.gender = "",
  this.location,
 this.name});
 factory Result.fromjson(Map<String, dynamic> jsonData){
  return Result(
  gender: jsonData['gender'],
   name: jsonData['name'] != null ? Name.fromjason(jsonData['name']):null,
   location: jsonData['location'] != null ? Location.fromjson(jsonData['location']):null,
  );
 }
 static List<Result> list1 (List results){
  List<Result> listresults = [];
  for(int i = 0; i < results.length; i++){
   listresults.add(Result.fromjson(results[i]));
  }
  return listresults;
 }
}
class Name {
 String title ="";
 String first = "";
 String last = "";
 Name({this.title = "",
 this.last = "",
 this.first = ""});
 factory Name.fromjason(Map<String, dynamic> jsonDate){
  return Name(
   title: jsonDate['title']
  );
 }
}
class Location {
 Street? street;
 String city = "";
 Coordinates? coordinates;
 Location({this.street,this.city = "",this.coordinates});
 factory Location.fromjson(Map<String, dynamic> jsonData){
  return Location(
  street: jsonData['street'] != null ? Street.fromjson(jsonData['street']):null,
   city: jsonData['city'],
   coordinates: jsonData['coordinates'] != null ? Coordinates.fromjson(jsonData['coordinates']):null,
  );
 }
}
class Street{
 int number = 0;
 Street({this.number= 0});
 factory Street.fromjson(Map<String , dynamic> jsonData){
  return Street(
   number: jsonData['number'],
  );
 }
}
class Coordinates{
 String latitude = "";
 String longitude = "";
 Coordinates({
  this.latitude = "",
  this.longitude = ""
});
 factory Coordinates.fromjson(Map<String, dynamic> jsonData){
  return Coordinates(
   latitude: jsonData['latitude'],
   longitude: jsonData['longitude'],
  );
 }
}