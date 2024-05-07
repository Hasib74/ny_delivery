
class CountryModel{
 String? id, name,code,phone_code;

 CountryModel.fromJson(Map<String,dynamic>json){

   this.id =  json['id'].toString();
   this.phone_code = json['phone_code'].toString();
   this.name = json['name'].toString();
   this.code = json['code'].toString();
   print(json);
 }

  CountryModel(this.id,this.phone_code,this.code,this.name){}

}