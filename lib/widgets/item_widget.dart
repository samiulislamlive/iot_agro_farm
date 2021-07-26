import 'package:flutter/material.dart';
import 'package:flutterprojectshere/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      child: ListTile(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => nothing(),
              ));
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
      ),
    );
  }
}

class nothing extends StatelessWidget {
  const nothing({Key? key}) : super(key: key);

  final String temp = "33.2° Celsius", humidity = "81" , moist = "0%", tresp = "NO";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information Checker"),

      ),
      body: Center(
        child: Text(("The Temperature is= $temp\n The Humidity is = $humidity\n The Soil Moisture level is = $moist\n Any Trespassers= $tresp "),
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),),
      ),
    );
  }
}

