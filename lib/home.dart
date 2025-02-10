import 'package:flutter/material.dart';
import 'package:search_and_filter/models/models.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = TextEditingController();
  String selectedCondition = 'All';
  List<Weather> weather = allWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search and Filter'),
      ),
      body: Column(
        children: <Widget>[
          // 🔹 Input Pencarian
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onChanged: searchAndFilter,
            ),
          ),

          // 🔹 Dropdown Filter
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<String>(
              value: selectedCondition,
              isExpanded: true,
              items: ['All', 'Clear', 'Rainy', 'Cloudy', 'Snowy']
                  .map((condition) => DropdownMenuItem(
                        value: condition,
                        child: Text(condition),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCondition = newValue!;
                  searchAndFilter(controller.text);
                });
              },
            ),
          ),

          // 🔹 ListView Hasil Filter
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
                  title: Text(weathers.city),
                  subtitle: Text(weathers.condition),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void searchAndFilter(String query) {
    final filteredWeather = allWeather.where((weather) {
      final cityLower = weather.city.toLowerCase();
      final conditionLower = weather.condition.toLowerCase();
      final searchLower = query.toLowerCase();

      final matchesSearch = cityLower.contains(searchLower);

      final matchesFilter =
          (selectedCondition == 'All' || conditionLower == selectedCondition.toLowerCase());

      return matchesSearch && matchesFilter;
    }).toList();

    setState(() {
      weather = filteredWeather;
    });
  }
}
