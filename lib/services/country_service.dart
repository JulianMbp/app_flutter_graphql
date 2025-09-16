import 'package:app_graphql/config/graphql_config.dart';
import 'package:app_graphql/models/country.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryService {
  static final ValueNotifier<GraphQLClient> _client =
      GraphQLConfig.clientToQuery();

  static String countryQuery = r'''
    query GetCountry($code: ID!) {
      country(code: $code) {
        name
        native
        capital
        emoji
        currency
        languages {
          code
          name
        }
      }
    }
  ''';

  Future<Country?> getCountry(String code) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(countryQuery),
        variables: {'code': code},
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await _client.value.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final countryData = result.data?['country'];
      if (countryData == null) return null;

      return Country.fromJson(countryData as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Error fetching country: $e');
    }
  }

  // Devuelve la lista de códigos de todos los países
  static String countriesCodesQuery = r'''
    query GetCountryCodes {
      countries {
        code
      }
    }
  ''';

  Future<List<String>> getAllCountryCodes() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(countriesCodesQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await _client.value.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final List<dynamic> codesData = result.data?['countries'] ?? [];
      return codesData
          .map<String>((c) => (c as Map<String, dynamic>)['code'] as String)
          .toList();
    } catch (e) {
      throw Exception('Error fetching country codes: $e');
    }
  }
}
