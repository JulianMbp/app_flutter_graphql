import 'package:app_graphql/controllers/country_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CountryController countryController = Get.find<CountryController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GraphQL Country'), elevation: 2),
      body: RefreshIndicator(
        onRefresh: () => countryController.fetchRandomCountry(),
        child: Obx(() {
          if (countryController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (countryController.error.value.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${countryController.error.value}',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => countryController.fetchRandomCountry(),
                    child: Text('Reintentar'),
                  ),
                ],
              ),
            );
          } else if (countryController.country.value == null) {
            return Center(child: Text('No hay datos del país'));
          } else {
            final c = countryController.country.value!;
            return ListView(
              padding: EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Text(c.emoji ?? '', style: TextStyle(fontSize: 40)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.name ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(c.native ?? '', style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text('Capital'),
                  subtitle: Text(c.capital ?? 'N/A'),
                ),
                ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('Currency'),
                  subtitle: Text(c.currency ?? 'N/A'),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Languages'),
                  subtitle: c.languages.isEmpty
                      ? Text('N/A')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: c.languages.map((l) => Text('${l.name} (${l.code})')).toList(),
                        ),
                ),
              ],
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => countryController.fetchRandomCountry(),
        label: Text('Random Country'),
        icon: Icon(Icons.shuffle),
      ),
    );
  }
}
