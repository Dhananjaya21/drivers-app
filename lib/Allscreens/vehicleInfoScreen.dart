import 'package:drivers_app/Allscreens/Mainscreen.dart';
import 'package:drivers_app/Allscreens/registrationScreen.dart';
import 'package:drivers_app/configMaps.dart';
import 'package:drivers_app/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class vehicleInfoScreen extends StatelessWidget
{

  static const String idScreen = "vehicleinfo";
  TextEditingController busRouteEditingController = TextEditingController();
  TextEditingController busNumberEditingController = TextEditingController();
  TextEditingController busColorEditingController = TextEditingController();
  String? selectedCarType;
  List<String> carTypesList = ["semi luxury", "luxury"];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 22.0,),
              Image.asset("images/logo3.png",width: 500.0,height: 200.0,),
              Padding(
                padding: EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 32.0),
                child: Column(
                  children: [
                    SizedBox(height: 12.0,),
                    Text("Enter vehicle details", style: TextStyle(fontFamily: "Brand-Bold", fontSize: 24.0),),

                    SizedBox(height: 26.0,),
                    TextField(
                      controller: busRouteEditingController,
                      decoration: InputDecoration(
                        labelText: "Bus Route",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),

                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: busNumberEditingController,
                      decoration: InputDecoration(
                        labelText: "Bus Number Plate",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),

                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: busColorEditingController,
                      decoration: InputDecoration(
                        labelText: "Bus colour",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0),

                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 42.0,),

                    DropdownButton<String?>(
                      iconSize: 40,
                      hint: Text('Please choose Bus Type'),
                      value: selectedCarType,
                      onChanged: (newValue) {
                          selectedCarType = newValue;
                          displayToastMessage(selectedCarType!, context);

                      },
                      items: carTypesList.map((car) {
                        return DropdownMenuItem(
                          child: new Text(car),
                          value: car,
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 42.0,),
                    
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: RaisedButton(
                        onPressed: ()
                        {
                          if(busNumberEditingController.text.isEmpty)
                            {
                              displayToastMessage("Please write a bus number", context);
                            }
                          if(busRouteEditingController.text.isEmpty)
                          {
                            displayToastMessage("Please write a bus number", context);
                          }
                          if(busColorEditingController.text.isEmpty)
                          {
                            displayToastMessage("Please give a colour", context);
                          }
                          if(selectedCarType == null)
                          {
                            displayToastMessage("Please select a bus type", context);
                          }
                          else{
                            saveDriverVehicleInfo(context);
                          }
                        },
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Next", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.white),),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 26.0,)
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveDriverVehicleInfo(context)
  {
    String userId = currentfirebaseUser!.uid;

    Map vehicleInfoMap =
        {
          "vehicle_route": busRouteEditingController.text,
          "vehicle_number": busNumberEditingController.text,
          "vehicle_Colour": busColorEditingController.text,
          "type" : selectedCarType,
        };
    driversRef.child(userId).child("vehicle_details").set(vehicleInfoMap);

    Navigator.pushNamedAndRemoveUntil(context, mainScreen.idScreen, (route) => false);
  }
}
