import 'package:flutter/material.dart';


import '../../../../core/utils/converters.dart';
import '../../../../main.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = AppThemeContainer.of(context).theme;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,onPressed: () => Navigator.pop(context),),
        backgroundColor: Colors.white,
        title: Text("Settings",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
          
           const Padding(
              padding:
                   EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 8),
              child:  Text(
                "Unit",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.black
                    .withOpacity(0.1),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 const Text(
                    "Celsius",
                    style: TextStyle(color: Colors.black),
                  ),
                  Radio(
                    value: TemperatureUnit.celsius.index,
                    groupValue:
                        AppThemeContainer.of(context).temperatureUnit.index,
                    onChanged: (value) {
                      AppThemeContainer.of(context)
                          .updateTemperatureUnit(TemperatureUnit.values[value as int]);
                    },
                    activeColor: Colors.black,
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            Container(
              color: Colors.black
                  .withOpacity(0.1),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Fahrenheit",
                    style: TextStyle(color:Colors.black,),
                  ),
                  Radio(
                    value: TemperatureUnit.fahrenheit.index,
                    groupValue:
                        AppThemeContainer.of(context).temperatureUnit.index,
                    onChanged: (value) {
                      AppThemeContainer.of(context)
                          .updateTemperatureUnit(TemperatureUnit.values[value as int]);
                    },
                    activeColor: Colors.black,
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                color:Colors.black
                    .withOpacity(0.1),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Kelvin",
                    style: TextStyle(color: Colors.black),
                  ),
                  Radio(
                    value: TemperatureUnit.kelvin.index,
                    groupValue:
                        AppThemeContainer.of(context).temperatureUnit.index,
                    onChanged: (value) {
                      AppThemeContainer.of(context)
                          .updateTemperatureUnit(TemperatureUnit.values[value as int]);
                    },
                    activeColor: Colors.black,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
