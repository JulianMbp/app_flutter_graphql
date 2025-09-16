import 'dart:math';

import 'package:app_graphql/models/country.dart';
import 'package:app_graphql/services/country_service.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  final CountryService _countryService = CountryService();

  final Rxn<Country> country = Rxn<Country>();
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountry('BR');
  }

  Future<void> fetchCountry(String code) async {
    isLoading.value = true;
    error.value = '';

    try {
      final result = await _countryService.getCountry(code);
      country.value = result;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  Future<void> fetchRandomCountry() async {
    try {
      isLoading.value = true;
      error.value = '';

      final codes = await _countryService.getAllCountryCodes();
      if (codes.isEmpty) {
        isLoading.value = false;
        error.value = 'No se encontraron códigos de país';
        return;
      }

      final rand = Random();
      final randomCode = codes[rand.nextInt(codes.length)];
      await fetchCountry(randomCode);
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
