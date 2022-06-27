
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarMakeList extends StatefulWidget {
  const CarMakeList({Key? key}) : super(key: key);

  @override
  State<CarMakeList> createState() => _CarMakeListState();
}

class _CarMakeListState extends State<CarMakeList> {
  // late final List _carMake = List<dynamic>.empty(growable: true) ;
  List _carMake = [];
  String? selectedName;
  List _carModel = [];
  String? selectedModel;

  Future getCarMake() async{
    var url = Uri.parse("https://dist.octamile.com/makeList");
    var response = await http.get(url);
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

     setState((){
       _carMake = jsonData;
     });
    print(jsonData);
    return 'Success';
  }


  Future getCarModel() async{
    var urls = Uri.parse("https://dist.octamile.com/modelList?make_id=147");
    var response = await http.get(urls);
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState((){
      _carModel = jsonData;
    });
    print(jsonData);
    return 'Success';
  }



  @override
  void initState() {
    super.initState();
    getCarMake();
    getCarModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        color: Colors.white,
        child: Column(
          children: [

            SizedBox(height: 20),
            Container(
              //margin:  EdgeInsets.only(top: 10.h),
              padding: EdgeInsets.symmetric(vertical:2, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: Colors.grey
                  )

              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton <String>(
                    isExpanded: true,
                    iconSize: 36,
                    hint: const Text('choose your profession'),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
                    value: selectedName,
                    items: _carMake.map((carMake) {
                      return DropdownMenuItem(
                        child: Text(carMake['make']),
                        value: carMake['make'].toString(),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedName = value;
                        print(value);
                      });
                    }
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              margin:  EdgeInsets.only(top: 0.01),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: Colors.grey
                  )

              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton <String>(
                    isExpanded: true,
                    iconSize: 36,
                    hint: const Text('Select your model'),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
                    value: selectedModel,
                    items: _carModel.map((carModel) {
                      return DropdownMenuItem(
                        child: Text(carModel['model'].toString()),
                        value: carModel['model'].toString(),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedModel = value;
                        print(value);
                      });
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



