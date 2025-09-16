import 'package:app_graphql/config/graphql_config.dart';
import 'package:app_graphql/controllers/country_controller.dart';
import 'package:app_graphql/rest/screens/user_list_screen.dart';
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
        debugShowCheckedModeBanner: false,
        // Pantalla inicial: selector entre GraphQL y REST
        home: RootScreen(),
        getPages: [
          GetPage(name: '/graphql', page: () => HomeScreen()),
          GetPage(name: '/rest', page: () => const UserListScreen()),
        ],
      ),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar modo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => Get.toNamed('/graphql'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text('Abrir GraphQL', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Get.toNamed('/rest'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text('Abrir REST', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
