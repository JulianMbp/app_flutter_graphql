import 'package:app_graphql/config/graphql_config.dart';
import 'package:app_graphql/controllers/country_controller.dart';
import 'package:app_graphql/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // Inicializar Hive para GraphQL
  await initHiveForFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  // Inicializar el controlador de país como un singleton global
  Get.put(CountryController());

    return GraphQLProvider(
      client: GraphQLConfig.clientToQuery(),
      child: GetMaterialApp(
        title: 'Flutter GraphQL App',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
