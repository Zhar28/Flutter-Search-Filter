import 'package:flutter/material.dart';
import 'package:search_and_filter/models/models.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = TextEditingController();
  List<Weather> weather = allWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search and filter'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: weather.length,
            itemBuilder: (context, index) {
              final weathers = weather[index];

              return ListTile(
                leading: Image.network(
                  weathers.icon,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                title: Text(weathers.city,),
                subtitle: Text(weathers.condition),
              );
            },
          ))
        ],
      ),
    );
  }
}
