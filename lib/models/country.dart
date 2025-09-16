class Language {
  final String? code;
  final String? name;

  Language({this.code, this.name});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );
  }
}

class Country {
  final String? name;
  final String? native;
  final String? capital;
  final String? emoji;
  final String? currency;
  final List<Language> languages;

  Country({
    this.name,
    this.native,
    this.capital,
    this.emoji,
    this.currency,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    final langs = <Language>[];
    if (json['languages'] != null) {
      for (final l in (json['languages'] as List<dynamic>)) {
        if (l != null) langs.add(Language.fromJson(l as Map<String, dynamic>));
      }
    }

    return Country(
      name: json['name'] as String?,
      native: json['native'] as String?,
      capital: json['capital'] as String?,
      emoji: json['emoji'] as String?,
      currency: json['currency'] as String?,
      languages: langs,
    );
  }
}
