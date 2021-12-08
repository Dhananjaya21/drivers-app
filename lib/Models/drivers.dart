import 'package:firebase_database/firebase_database.dart';

class Drivers
{
  String? name;
  String? phone;
  String? email;
  String? id;
  String? vehicle_number;
  String? vehicle_route;
  String? vehicle_type;

  Drivers({this.name, this.phone,this.email, this.id, this.vehicle_number, this.vehicle_route, this.vehicle_type});

  Drivers.fromSnapshot(DataSnapshot dataSnapshot)
  {
    id = dataSnapshot.key;
    phone = dataSnapshot.value["phone"];
    email = dataSnapshot.value["email"];
    name = dataSnapshot.value["name"];
    vehicle_number = dataSnapshot.value["vehicle_details"]["vehicle_number"];
    vehicle_route = dataSnapshot.value["vehicle_details"]["vehicle_route"];
    vehicle_type = dataSnapshot.value["vehicle_details"]["vehicle_type"];


  }

}