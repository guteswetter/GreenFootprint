import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['de', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? deText = '',
    String? enText = '',
  }) =>
      [deText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'voriaocg': {
      'de': 'Login',
      'en': 'Login',
    },
    'lbac6rj2': {
      'de': 'Passwort vergessen?',
      'en': 'Forgot password?',
    },
    'r0ikytip': {
      'de': 'Login',
      'en': 'Login',
    },
    'ciuvgeo7': {
      'de': 'Noch kein Konto?\n',
      'en': 'No account yet?',
    },
    'mmg3x53o': {
      'de': 'Hier registrieren',
      'en': 'Register here',
    },
    'jh0noj53': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // Dashboard
  {
    '4wftuxzs': {
      'de': 'Woche',
      'en': 'Day',
    },
    'pw4a27sa': {
      'de': 'Tag',
      'en': 'Week',
    },
    '14aqzw7s': {
      'de': 'Woche',
      'en': 'Week',
    },
    'spv55euu': {
      'de': 'Total CO2e diese Woche: ',
      'en': 'Total CO2e current week:',
    },
    'xz0vnczb': {
      'de': 'kg',
      'en': 'kg',
    },
    'xaehcokq': {
      'de': 'Wohnen, Energie & Konsum',
      'en': 'Housing, Energy & Consumption',
    },
    'ah5urdxm': {
      'de': 'Ernährung',
      'en': 'Nutrition',
    },
    'wed63zxu': {
      'de': 'Reisen',
      'en': 'Travel',
    },
    'zz7hm8en': {
      'de': 'Top 5 Co2-Verursacher (letzte 7 Tage)',
      'en': 'Top 5 CO2 emitters (past 7 days)',
    },
    'v0kdyeps': {
      'de': 'In den letzten 7 Tagen wurden noch keine Daten erfasst.',
      'en': 'No data has been recorded in the last 7 days.',
    },
    'befpzpn0': {
      'de': 'Total CO2e heute: ',
      'en': 'Total CO2e today:',
    },
    '2nif2dby': {
      'de': 'kg',
      'en': 'kg',
    },
    'ied9g9jb': {
      'de': 'Wohnen, Energie & Konsum',
      'en': 'Housing, Energy & Consumption',
    },
    'qvie67ac': {
      'de': 'Ernährung',
      'en': 'Nutrition',
    },
    'g2hli2k3': {
      'de': 'Reisen',
      'en': 'Travel',
    },
    'wfqs0otv': {
      'de': 'Top 5 Co2-Verursacher heute',
      'en': 'Top 5 CO2 emitters (past 7 days)',
    },
    'f167xwse': {
      'de': 'Für heute wurden noch keine Daten erfasst.',
      'en': 'No data has been recorded for today.',
    },
    'wv313jht': {
      'de': 'Auswertung',
      'en': 'Evaluation',
    },
  },
  // Wohnen2
  {
    'pdarcgu5': {
      'de': '',
      'en': '',
    },
    'a234fh5h': {
      'de': 'Kategorie 2: Energie',
      'en': 'Category 2: Energy',
    },
    'p19oq3qc': {
      'de': 'Wie wird dein Wasser geheizt?',
      'en': 'How is your water heated?',
    },
    'jk4ikq16': {
      'de': 'Ölheizung',
      'en': 'Oil heating',
    },
    '62tuajuz': {
      'de': 'Ölheizung mit Solarpanels',
      'en': 'Oil heating with solar panels',
    },
    '3qsb623z': {
      'de': 'Gasheizung',
      'en': 'Gas heating',
    },
    'qkm6ltzb': {
      'de': 'Gasheizung mit Solarpanels',
      'en': 'Gas heating with solar panels',
    },
    'd3fep1zb': {
      'de': 'Fernwärme',
      'en': 'District heating',
    },
    'khz1p22x': {
      'de': 'Elektroheizung',
      'en': 'Electric heating',
    },
    'g9hvkzaz': {
      'de': 'Wärmepumpe',
      'en': 'Heat pump',
    },
    '5kx4i3vt': {
      'de': 'Holz mit Solarpanels',
      'en': 'Wood with solar panels',
    },
    't0gf8oen': {
      'de': 'Holz (Pellets, Scheite)',
      'en': 'Wood (pellets, logs)',
    },
    't1ur5osv': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'mrc6yni0': {
      'de': 'Suche...',
      'en': 'Search...',
    },
    'aaum2l8o': {
      'de':
          'Welche (durchschnittliche) Energieeffizienz haben deine Elektrogeräte?',
      'en':
          'What (average) energy efficiency do your electrical appliances have?',
    },
    '9kg19lry': {
      'de': 'Schlechter als A',
      'en': 'Worse than A',
    },
    'lbqsdsb0': {
      'de': 'A',
      'en': 'A',
    },
    'ay1gssbm': {
      'de': 'A+',
      'en': 'A+',
    },
    'd6tq9ujf': {
      'de': 'A++',
      'en': 'A++',
    },
    'k21g6s81': {
      'de': 'Keine Ahnung - die meisten Geräte sind älter als 10 Jahre',
      'en': 'Don\'t know - most devices are older than 10 years',
    },
    'ziw04lqg': {
      'de': 'Keine Ahnung - die meisten Geräte sind neuer als 10 Jahre',
      'en': 'Don\'t know - most devices are newer than 10 years',
    },
    '7ypedy6c': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'pm7ofxjv': {
      'de': 'Suche...',
      'en': 'Search...',
    },
    '2tyu754q': {
      'de': 'Welche Kühlgeräte nutzt  du?',
      'en': 'Which refrigerators do you use?',
    },
    'lifhwk0o': {
      'de': 'Kühlschrank mit Gefrierfach',
      'en': 'Refrigerator with freezer compartment',
    },
    'ctxaj9zp': {
      'de': 'Kühlschrank/Tiefkühlerkombination (zweitürig) ',
      'en': 'Refrigerator/freezer combination (two-door)',
    },
    'lpjtmger': {
      'de': 'Kühlschrank mit Gefierfach und Tiefkühltruhe',
      'en': 'Refrigerator with freezer compartment and freezer',
    },
    'cii8xolk': {
      'de': 'Mehrere Kühlschränke und/oder Gefriertruhen',
      'en': 'Multiple refrigerators and/or freezers',
    },
    'kjybyhv2': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '2vxy5rwf': {
      'de': 'Suche...',
      'en': 'Search...',
    },
    'cktilbdh': {
      'de': 'Wie wäschst du deine Wäsche?',
      'en': 'How do you wash your clothes?',
    },
    'yjfz5xpf': {
      'de': 'Über die Hälfte 30 °C und weniger, selten 60 °C ',
      'en': 'More than half 30 °C and less, rarely 60 °C',
    },
    '2cw34qdp': {
      'de': 'Den grössten Teil 40 °C, ca. 1/3 60 °C, keine Kochwäsche (95 °C)',
      'en': 'Most of it 40 °C, approx. 1/3 60 °C, no boiling (95 °C)',
    },
    'hdqyqyc0': {
      'de': 'Gemäss Herstellerangabe, gelegentlich Kochwäsche (95 °C)',
      'en':
          'According to manufacturer\'s instructions, occasional boil wash (95 °C)',
    },
    'ba7n2xbq': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'yck7hk5u': {
      'de': 'Suche...',
      'en': 'Search...',
    },
    'iya8srmb': {
      'de': 'Wie trocknest du deine Wäsche?',
      'en': 'How do you dry your laundry?',
    },
    'c836p14u': {
      'de': 'Wäscheleine',
      'en': 'Clothesline',
    },
    'kh2og6qb': {
      'de': 'Teils im Tumbler / teils an der Wäscheleine',
      'en': 'Partly in the tumble dryer / partly on the clothesline',
    },
    'vbfjlfvp': {
      'de': 'Nur im Tumbler',
      'en': 'Only in the tumble dryer',
    },
    '9t06ruae': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'tsyg7aqe': {
      'de': 'Suche...',
      'en': 'Search...',
    },
    '2i01ap0n': {
      'de':
          'Welcher Anteil deines Stroms läuft unter dem Label \"naturemade Star\"?',
      'en':
          'What proportion of your electricity comes under the “naturemade Star” label?',
    },
    'zwrosfa3': {
      'de': 'Kein Anteil',
      'en': 'No share',
    },
    'ifgfobd2': {
      'de': 'Ein Teil davon',
      'en': 'Part of it',
    },
    'p05eybg9': {
      'de': 'Alles',
      'en': 'Everything',
    },
    'tuo9hfxq': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'r7v6hgij': {
      'de': 'Suche..',
      'en': 'Search...',
    },
    'goe244bm': {
      'de': 'Weiter',
      'en': 'Continue',
    },
    'pqwtnyjr': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // Wohnen1
  {
    'fmarnf6g': {
      'de': '',
      'en': '',
    },
    'ocn8h9uu': {
      'de': 'Kategorie 1: Wohnen',
      'en': 'Category 1: Housing',
    },
    'rdf727wu': {
      'de': 'In welchem Typ Haus wohnst du?',
      'en': 'What type of house do you live in?',
    },
    's87sfgc2': {
      'de': 'Einfamilienhaus',
      'en': 'Single-family home',
    },
    '8nvsmzc5': {
      'de': 'Mehrfamilienhaus',
      'en': 'Apartment building',
    },
    '128outke': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'jesjx067': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'iqh0y5r2': {
      'de': 'Wie heizt du dein Zuhause?',
      'en': 'How do you heat your home?',
    },
    'ydm4i4i2': {
      'de': 'Ölheizung',
      'en': 'Oil heating',
    },
    '4r5afmex': {
      'de': 'Ölheizung mit Solarpanels',
      'en': 'Oil heating with solar panels',
    },
    'fsewm7i3': {
      'de': 'Gasheizung',
      'en': 'Gas heating',
    },
    'sp2w3p2k': {
      'de': 'Gasheizung mit Solarpanels',
      'en': 'Gas heating with solar panels',
    },
    'ahm51rfe': {
      'de': 'Fernwärme',
      'en': 'District heating',
    },
    'nhliiu18': {
      'de': 'Elektroheizung',
      'en': 'Electric heating',
    },
    'g6knvh08': {
      'de': 'Wärmepumpe',
      'en': 'Heat pump',
    },
    'zk3p7gb1': {
      'de': 'Holz mit Solarpanels',
      'en': 'Wood with solar panels',
    },
    'ceypnvpe': {
      'de': 'Holz (Pellets, Scheite)',
      'en': 'Wood (pellets, logs)',
    },
    '6rvsy0xk': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'scwmxak8': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'wcqu8gs5': {
      'de': 'Baujahr oder Minergie-Standard',
      'en': 'Year of construction or Minergie standard',
    },
    '7w9vzsz1': {
      'de': 'Vor 1980',
      'en': 'Before 1980',
    },
    'ezctyjf8': {
      'de': '1980 - 1990',
      'en': '1980 - 1990',
    },
    '5icmlxtl': {
      'de': '1991 - 2008',
      'en': '1991 - 2008',
    },
    '2d0aihvz': {
      'de': 'Nach 1980',
      'en': 'After 1980',
    },
    'tyya15gg': {
      'de': 'Minergie',
      'en': 'Minergie',
    },
    'tt1wncc8': {
      'de': 'Minergie-A',
      'en': 'Minergie-A',
    },
    'ass74h7i': {
      'de': 'Minergie-P',
      'en': 'Minergie-P',
    },
    'v2jnqudh': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '7wkb4n3l': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'lplh7w22': {
      'de': 'Durchschnittliche Raumtemperatur',
      'en': 'Average room temperature',
    },
    'a9wwee0q': {
      'de': '<= 17 °C',
      'en': '<= 17 °C',
    },
    'plm6q5ry': {
      'de': '18 - 19 °C',
      'en': '18 - 19 °C',
    },
    'esmcwa6w': {
      'de': '20 - 22 °C',
      'en': '20 - 22 °C',
    },
    '1ba93cwt': {
      'de': '> 22 °C',
      'en': '> 22 °C',
    },
    'u0pr18vg': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '06v0ahxk': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'npok4li1': {
      'de': 'Beheizte Fläche',
      'en': 'Heated area',
    },
    'vznedj4n': {
      'de': '> 30 m2',
      'en': '> 30 m2',
    },
    '0dekrds5': {
      'de': '30 - 50 m2',
      'en': '30 - 50 m2',
    },
    'qt9begpw': {
      'de': '51 - 75 m2',
      'en': '51 - 75 m2',
    },
    'whxis3tq': {
      'de': '76 - 100 m2',
      'en': '76 - 100 m2',
    },
    'usd1r5z2': {
      'de': '101 - 125 m2',
      'en': '101 - 125 m2',
    },
    '24tdgm2t': {
      'de': '126 - 150 m2',
      'en': '126 - 150 m2',
    },
    'p03m0yvy': {
      'de': '151 - 200 m2',
      'en': '151 - 200 m2',
    },
    'ydb3dpod': {
      'de': '201 - 300 m2',
      'en': '201 - 300 m2',
    },
    'ocnf9hso': {
      'de': '> 300 m2',
      'en': '> 300 m2',
    },
    'h4onuvmw': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '6f8sqsov': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'cz6cmzgl': {
      'de': 'Wie viele Personen wohnen in deinem Haushalt?',
      'en': 'How many people live in your household?',
    },
    'auw3262c': {
      'de': '1',
      'en': '1',
    },
    'b9dpt9df': {
      'de': '2',
      'en': '2',
    },
    'va091wg4': {
      'de': '3',
      'en': '3',
    },
    'rwet2f0t': {
      'de': '4',
      'en': '4',
    },
    '4364epa5': {
      'de': '5',
      'en': '5',
    },
    'z8fhk2p2': {
      'de': '6',
      'en': '6',
    },
    '62j2z4by': {
      'de': '7 (oder mehr)',
      'en': '7 (or more)',
    },
    'olducrij': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '8izvssmf': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'ncj0z7vg': {
      'de': 'Weiter',
      'en': 'Continue',
    },
    'q4zay1m1': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // Wohnen3
  {
    '21c9ndzc': {
      'de': '',
      'en': '',
    },
    'h2bhgbjy': {
      'de': 'Kategorie 3: Konsum',
      'en': 'Category 3: Consumption',
    },
    '2zj1uml4': {
      'de': 'Wie hoch sind deine monatlichen Ausgaben für...',
      'en': 'How much money do you spend monthly on...',
    },
    'c094rzi5': {
      'de': 'Schuhe und Kleidung?',
      'en': 'Shoes and clothes?',
    },
    '6wvgbasu': {
      'de': 'Sehr tief (ca. 20 CHF oder weniger)',
      'en': 'Very low (approx. 20 CHF or less)',
    },
    'r7efydzw': {
      'de': 'Tief (ca. 50 CHF)',
      'en': 'Low (approx. 50 CHF)',
    },
    '55gab7uf': {
      'de': 'Durchschnitt (ca. 100 CHF)',
      'en': 'Average (approx. 100 CHF)',
    },
    '3ayyzb2h': {
      'de': 'Hoch (ca. 125 CHF)',
      'en': 'High (approx. 125 CHF)',
    },
    'avzcjmzv': {
      'de': 'Sehr hoch (ca. 250 CHF oder mehr)',
      'en': 'Very high (approx. 250 CHF or more)',
    },
    'krdup6ks': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '8tv7f9vz': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'cdhqlevo': {
      'de': 'Hobbies, Freizeitaktivitäten und Haustiere?',
      'en': 'Hobbies, leisure activities and pets?',
    },
    '2onecr8v': {
      'de': 'Sehr tief (50 CHF oder weniger)',
      'en': 'Very low (50 CHF or less)',
    },
    'uizlnpgb': {
      'de': 'Tief (ca. 150 CHF)',
      'en': 'Low (approx. 150 CHF)',
    },
    '7j5lm876': {
      'de': 'Durchschnitt (ca. 260 CHF)',
      'en': 'Average (approx. 260 CHF)',
    },
    'pqaf9zze': {
      'de': 'Hoch (ca. 400 CHF)',
      'en': 'High (approx. 400 CHF)',
    },
    'cpqdqvoz': {
      'de': 'Sehr hoch (ca. 600 CHF oder mehr)',
      'en': 'Very high (approx. 600 CHF or more)',
    },
    '0zpynqlg': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '2d8coe73': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'jzbpgi5q': {
      'de': 'Möbel und Haushaltsgeräte?',
      'en': 'Furniture and household appliances?',
    },
    'exv18f9r': {
      'de': 'Sehr tief (25 CHF oder weniger)',
      'en': 'Very low (25 CHF or less)',
    },
    '77l7mod7': {
      'de': 'Tief (ca. 75 CHF)',
      'en': 'Low (approx. 75 CHF)',
    },
    'hic3yhd2': {
      'de': 'Durchschnitt (ca. 125 CHF)',
      'en': 'Average (approx. 125 CHF)',
    },
    'r0s4l8sw': {
      'de': 'Hoch (ca. 200 CHF)',
      'en': 'High (approx. 200 CHF)',
    },
    'jqlp8ubb': {
      'de': 'Sehr hoch (ca. 300 CHF oder mehr)',
      'en': 'Very high (approx. 300 CHF or more)',
    },
    'w66bog5b': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'uhksm5ob': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '3u2p811n': {
      'de': 'Auswertige Verpflegung?',
      'en': 'Food from outside?',
    },
    '6aliignc': {
      'de': 'Sehr tief (50 CHF oder weniger)',
      'en': 'Very low (50 CHF or less)',
    },
    'e2oite57': {
      'de': 'Tief (ca. 100 CHF)',
      'en': 'Low (approx. 100 CHF)',
    },
    'orlk9gaq': {
      'de': 'Durchschnitt (ca. 250 CHF)',
      'en': 'Average (approx. 250 CHF)',
    },
    'qrhs62s4': {
      'de': 'Hoch (ca. 400 CHF)',
      'en': 'High (approx. 400 CHF)',
    },
    'fy2y3o3l': {
      'de': 'Sehr hoch (ca. 600 CHF oder mehr)',
      'en': 'Very high (approx. 600 CHF or more)',
    },
    '5crhh238': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '6j085r92': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'cdnzhpv0': {
      'de':
          'Welcher Anteil deiner Ersparnisse/Vorsorge ist nachhaltig angelegt?',
      'en':
          'What proportion of your savings/provisions are invested sustainably?',
    },
    '8za5xkik': {
      'de': 'Kein Anteil',
      'en': 'No share',
    },
    'w5nar7iz': {
      'de': 'Wenig',
      'en': 'Few',
    },
    'heo3qvrd': {
      'de': 'Viel',
      'en': 'Much',
    },
    '7xk4k4mk': {
      'de': 'Alles',
      'en': 'Everything',
    },
    'rw9gwh9s': {
      'de': 'Keine Ahnung',
      'en': 'No idea',
    },
    '7vhaa4cj': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'mfky6dm2': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'gzaqn74k': {
      'de': 'Abschliessen',
      'en': 'Finish',
    },
    '771x83r3': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // Willkommen
  {
    '6rumh4zd': {
      'de': 'Willkommen bei ',
      'en': 'Welcome to',
    },
    '0sqxj2kp': {
      'de': 'Green Footprint!',
      'en': 'Green Footprint!',
    },
    'tmm50edn': {
      'de':
          'Der App, die dir dabei hilft, deinen ökologischen Fussabdruck besser zu verstehen.',
      'en':
          'The app that helps you better understand your ecological footprint.',
    },
    'mesjz5jd': {
      'de': 'Wie funktioniert das?',
      'en': 'How does it work?',
    },
    'ecav7adt': {
      'de':
          'Du erfasst für einen bestimmten Zeitraum dein Konsumverhalten in den Bereichen Wohnen, Ernährung und Mobilität. Das sollte über einen Zeitraum von mindestens zwei Wochen geschehen, aber grundsätzlich gilt: Je länger, desto genauer wird dein Fussabdruck berechnet werden können. \n\nDabei ist es wichtig, dass du die Informationen möglichst detailgetreu erfasst, da dein Fussabdruck anhand deiner angaben berechnet wird.\n\n',
      'en':
          'You record your consumption behavior in the areas of housing, nutrition and mobility for a certain period of time. This should be done over a period of at least two weeks, but the general rule is: the longer, the more accurately your footprint can be calculated.\n\nIt is important that you record the information as accurately as possible, as your footprint is calculated based on your information.',
    },
    '6s8n7zk6': {
      'de': 'Weiter',
      'en': 'Continue',
    },
    'iizc0u7o': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // WohnenAuswertung
  {
    '0nps22yh': {
      'de': 'Gut gemacht!',
      'en': 'Well done!',
    },
    'qqdq5ukn': {
      'de':
          'Unten siehst du den ersten Teil deines ökologischen Fussabdrucks. Die Angaben sind in Kilogramm CO2e auf einen Tag heruntergerechnet. \n\nUm deine vollständigen CO2-Emissionen berechnen zu können, sind aber noch weitere Angaben notwendig.\n\nErfasse deine Mahlzeiten und deine Reisen, um dein Profil zu vervollständigen!\n',
      'en':
          'Below you can see the first part of your carbon footprint. However, to calculate your full CO2 emissions, more information is needed.\n\nRecord your meals and travel to complete your profile!\n\nClick on the diagram for more information.',
    },
    'twmszqiq': {
      'de': 'Wohnen',
      'en': 'Housing',
    },
    'k62vectl': {
      'de': 'Energie',
      'en': 'Energy',
    },
    'lyi19zcw': {
      'de': 'Konsum',
      'en': 'Consumption',
    },
    '269a835d': {
      'de': 'Zum Dashboard',
      'en': 'To the dashboard',
    },
    '7wdxeav5': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // Willkommen4
  {
    'nv60ubil': {
      'de': 'Schön dich kennen zu lernen, \n',
      'en': 'Nice to meet you, ',
    },
    'vk5nrigd': {
      'de': '😎',
      'en': '😎',
    },
    '8d7ywaqc': {
      'de':
          'Treibhausgase entstehen in allen Bereichen unseres täglichen Lebens. Für die Erfassung in dieser App haben wir sie in drei Bereiche aufgeteilt:',
      'en':
          'Greenhouse gases are produced in all areas of our daily lives. For the purposes of recording them in this app, we have divided them into three areas:',
    },
    'c7exkrdc': {
      'de': 'Wohnen, Energie und Konsum',
      'en': 'Housing, Energy and Consumption',
    },
    'y2eqbj89': {
      'de': 'Ernährung',
      'en': 'Nutrition',
    },
    'wfj2dt59': {
      'de': 'Mobilität',
      'en': 'Mobility',
    },
    '5auzsbqb': {
      'de': 'Die Kategorien ',
      'en': 'The categories',
    },
    '7lywxxgl': {
      'de': 'Ernährung ',
      'en': 'nutrition',
    },
    'qq7jq8p8': {
      'de': 'und ',
      'en': 'and',
    },
    '5uccfav1': {
      'de': 'Mobilität ',
      'en': 'mobility',
    },
    '4fgay3zu': {
      'de':
          'müssen regelmässig erfasst werden, wenn du etwas isst / trinkst oder eine Reise zurücklegst.\n\nDie Kategorie ',
      'en':
          'must be recorded regularly when you eat/drink something or travel.\n\nThe category',
    },
    'zl6upg20': {
      'de': 'Wohnen ',
      'en': 'housing',
    },
    'ts3wp4ae': {
      'de':
          'ändert sich in der Regel weniger. Sie muss zu Beginn einmal erfasst werden, und kann dann später bei Bedarf angepasst werden.\n\nLass uns daher gleich mit dieser Kategorie starten.\n',
      'en':
          'usually changes less. It has to be recorded once at the beginning and can then be adjusted later if necessary.\n\nSo let\'s start with this category.',
    },
    '1u5q233j': {
      'de': 'Bereit?',
      'en': 'Ready?',
    },
    'vakn8c12': {
      'de': 'Los geht\'s!',
      'en': 'Let\'s go!',
    },
    'rc38m7k1': {
      'de': 'Später erfassen',
      'en': 'Skip',
    },
    'v8aivdi8': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // Profil
  {
    '7jke4sut': {
      'de': 'Profil',
      'en': 'Profile',
    },
    'uks32o1l': {
      'de': 'Username',
      'en': '',
    },
    'r1j2edtu': {
      'de': 'Accounteinstellungen',
      'en': 'Account settings',
    },
    'krmy9kk4': {
      'de': 'E-Mail / Passwort ändern',
      'en': 'Change email / password',
    },
    'whe30ozb': {
      'de': 'Gruppeninfos',
      'en': 'Change language',
    },
    'dkqo6tqj': {
      'de': 'Name: ',
      'en': 'Name: ',
    },
    'v2aflf44': {
      'de': 'Start Periode:',
      'en': 'Start Period:',
    },
    'nasq6mpu': {
      'de': 'Ende Periode: ',
      'en': 'End period:',
    },
    '0q25pohd': {
      'de': 'Datenschutz',
      'en': 'Data protection',
    },
    '7ybdg0jn': {
      'de': 'Account löschen',
      'en': 'Delete account',
    },
    'axp0tpac': {
      'de': 'Daten zurücksetzen',
      'en': 'Reset options',
    },
    'haic29ou': {
      'de': 'Abmelden',
      'en': 'Log out',
    },
    'kapr373w': {
      'de': 'Profil',
      'en': 'Profile',
    },
  },
  // Erfassen
  {
    'qrij72p3': {
      'de': 'Welche Daten willst du erfassen oder bearbeiten?',
      'en': 'What data do you want to collect or process?',
    },
    'x39veudv': {
      'de': 'Mahlzeit',
      'en': 'Meal',
    },
    'gjg79ae0': {
      'de': 'Wohnen',
      'en': 'Housing',
    },
    'vvvs6dil': {
      'de': 'Reise ',
      'en': 'Trip',
    },
    '21m94k65': {
      'de': 'Flug ',
      'en': 'Flight',
    },
    '9htz48qz': {
      'de': 'Erfassen',
      'en': 'Capture',
    },
  },
  // MahlzeitUebersicht
  {
    'a7o5twdg': {
      'de': 'Neue Mahlzeit erfassen',
      'en': 'Enter new meal',
    },
    'm88vnkgp': {
      'de': 'Mahlzeit erfassen',
      'en': 'New meal',
    },
    'q1ehbreh': {
      'de': 'oder Mahlzeiten \nbearbeiten',
      'en': 'or\nEdit existing meals',
    },
    'kf8yb145': {
      'de': 'Erfasste Mahlzeit',
      'en': 'Recorded meals',
    },
    '7iha0mat': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // MahlzeitZutatenAuswaehlenBackup
  {
    '4j8ak6en': {
      'de': 'Neue Mahlzeit erfassen',
      'en': 'Choose your ingredients:',
    },
    'p76b9296': {
      'de': 'Option 1',
      'en': '',
    },
    'tex17an0': {
      'de': 'Option 2',
      'en': '',
    },
    'hqbxebnq': {
      'de': 'Option 3',
      'en': '',
    },
    'xi6xbhgh': {
      'de': 'Zutat auswählen...',
      'en': '',
    },
    'd4d5ovxl': {
      'de': 'Suche...',
      'en': '',
    },
    'q7jvo8qe': {
      'de': 'Total CO2e dieser Mahlzeit:',
      'en': 'Total CO2e of this meal:',
    },
    'vr9kxcze': {
      'de': 'kg',
      'en': 'kg',
    },
    '9u1isr5a': {
      'de': 'Mahlzeit speichern',
      'en': 'Save meal',
    },
    'j1gbi8hh': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // ReiseErfassen
  {
    'dqgh03zm': {
      'de': 'Reise erfassen',
      'en': 'Enter trip',
    },
    '4nksmqnb': {
      'de': 'TextField',
      'en': 'TextField',
    },
    '4v71quvh': {
      'de': 'Bus',
      'en': 'Bus',
    },
    'zl4hkswj': {
      'de': 'Zug (national)',
      'en': 'Train (national)',
    },
    '28jd9pw0': {
      'de': 'Zug (international)',
      'en': 'Train (international)',
    },
    '5x98mx0t': {
      'de': 'Tram',
      'en': 'Tram',
    },
    'pp226ldk': {
      'de': 'Auto',
      'en': 'Car',
    },
    'pkbmyym7': {
      'de': 'Transportmittel auswählen..',
      'en': 'Select means of transportation...',
    },
    'dn4wmhk5': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'wzr5scy9': {
      'de': 'Distanz:',
      'en': 'Distance:',
    },
    'jj5jr4xg': {
      'de': '0.0',
      'en': '0.0',
    },
    'ihixbxga': {
      'de': 'km',
      'en': 'km',
    },
    'wj2higel': {
      'de': 'Total CO2e dieser Reise:',
      'en': 'Total CO2e of this trip:',
    },
    'pufzpvtv': {
      'de': 'kg',
      'en': 'kg',
    },
    'apqylykp': {
      'de': 'Reise speichern',
      'en': 'Save trip',
    },
    '6zn1kmpt': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // ReiseUebersicht
  {
    '7cy71p73': {
      'de': 'Neue Reise erfassen',
      'en': 'Enter new trip',
    },
    'u5i6iowz': {
      'de': 'oder \nReise löschen',
      'en': 'or\nDelete trip',
    },
    '7gsmc0sg': {
      'de': 'Delete',
      'en': 'Delete',
    },
    'h8w3apqw': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // ReiseFlugErfassen
  {
    'e2ciyb6f': {
      'de': 'Flug erfassen',
      'en': 'Enter flight',
    },
    '72h0pqt9': {
      'de': 'Datum auswählen..',
      'en': '',
    },
    '94c1swet': {
      'de': 'Abflug von:',
      'en': 'Departure from:',
    },
    'k7vvt89e': {
      'de': 'Flughafen suchen...',
      'en': 'Search airport...',
    },
    '8d97wc6p': {
      'de': 'Nach:',
      'en': 'To:',
    },
    '2ocanxuu': {
      'de': 'Flughafen suchen...',
      'en': 'Search airport...',
    },
    '0n4m84xo': {
      'de': 'Inkl. Rückflug',
      'en': 'Return flight included',
    },
    '74qp8nmq': {
      'de': 'Klasse:',
      'en': 'Class:',
    },
    '93uzcmpt': {
      'de': 'Economy',
      'en': 'Economy',
    },
    'xmhcjsyn': {
      'de': 'Business',
      'en': 'Business',
    },
    '46jiwv26': {
      'de': 'First',
      'en': 'First',
    },
    'yu152be4': {
      'de': 'Economy',
      'en': 'Economy',
    },
    '582l7jza': {
      'de': 'Reise speichern',
      'en': 'Save flight',
    },
    'tgks9tu4': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // FlugUebersicht
  {
    'w5ma9llu': {
      'de': 'Neuen Flug erfassen',
      'en': 'Enter new flight',
    },
    'sjczzpdv': {
      'de': 'Flug erfassen',
      'en': 'New flight',
    },
    '9lcdxswp': {
      'de': 'Erfasste Flüge',
      'en': 'Recorded flights',
    },
    '60ilnweu': {
      'de': 'Delete',
      'en': 'Delete',
    },
    '6tzi3wl3': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // ReiseBearbeiten
  {
    'vczc1j6p': {
      'de': 'Reise bearbeiten',
      'en': 'Edit trip',
    },
    '450pfns4': {
      'de': 'TextField',
      'en': 'TextField',
    },
    'd2k2r7ty': {
      'de': 'Bus',
      'en': 'Bus',
    },
    'vjipg6ov': {
      'de': 'Zug (national)',
      'en': 'Train (national)',
    },
    'frh4v76l': {
      'de': 'Zug (international)',
      'en': 'Train (international)',
    },
    'rosz0ytq': {
      'de': 'Tram',
      'en': 'Tram',
    },
    'ulwoh4rq': {
      'de': 'Auto',
      'en': 'Car',
    },
    'tw2cilar': {
      'de': 'Transportmittel auswählen..',
      'en': 'Select means of transportation...',
    },
    'l5wnehqu': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'p5e79q50': {
      'de': 'Distanz:',
      'en': 'Distance:',
    },
    'kahfsokd': {
      'de': '0.0',
      'en': '0.0',
    },
    'p60p32yo': {
      'de': 'km',
      'en': 'km',
    },
    'ob3gqgwu': {
      'de': 'Total CO2e dieser Reise:',
      'en': 'Total CO2e of this trip:',
    },
    'p0qlvj6m': {
      'de': 'kg',
      'en': 'kg',
    },
    '55kzfnak': {
      'de': 'Reise speichern',
      'en': 'Save trip',
    },
    'xubznkca': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // Willkommen2
  {
    'j5bezidq': {
      'de': 'Wie sollen wir dich nennen?',
      'en': 'What should we call you?',
    },
    '04duq9as': {
      'de': 'Name',
      'en': 'Name',
    },
    'l49daib3': {
      'de': 'Bitte sag uns, wie wir dich ansprechen sollen',
      'en': 'Please tell us how to address you',
    },
    'isaoyrly': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'eqxgum7a': {
      'de': 'Weiter',
      'en': 'Continue',
    },
    'ez4egag1': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // WillkommenUnvollstaendig
  {
    '7ekm7in5': {
      'de': 'Willkommen zurück, ',
      'en': 'Welcome back, ',
    },
    'fn2xo6s2': {
      'de': '!',
      'en': '!',
    },
    'jnju8xc7': {
      'de':
          'Du hast noch nicht alle Fragen zu den Bereichen Wohnen, Energie & Konsum beantwortet. Für die Berechnung deines Fussabdrucks sind diese Fragen allerdings ziemlich wichtig.\n\nWillst du die Angaben jetzt vervollständigen?',
      'en':
          'You have not yet answered all the questions about housing, energy and consumption. However, these questions are very important for calculating your footprint.\n\nDo you want to complete the information now?',
    },
    'my9l11sy': {
      'de': 'Los geht\'s!',
      'en': 'Let\'s go!',
    },
    'fithuw5b': {
      'de': 'Später erfassen\n',
      'en': 'Skip',
    },
    'kj68kcok': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // MahlzeitZutatenAuswaehlen
  {
    '2f2a30os': {
      'de': 'Neue Mahlzeit erfassen',
      'en': 'Enter new meal',
    },
    '70ecjeoa': {
      'de': 'TextField',
      'en': 'TextField',
    },
    '05kgry2w': {
      'de': 'Option 1',
      'en': 'Option 1',
    },
    'ckiuv7bc': {
      'de': 'Option 2',
      'en': 'Option 2',
    },
    'qjmyeqmq': {
      'de': 'Option 3',
      'en': 'Option 3',
    },
    '5r96ivj5': {
      'de': 'Zutat auswählen..',
      'en': 'Select ingredient...',
    },
    'vpk9wza5': {
      'de': 'Zutat suchen...',
      'en': 'Search ingredient...',
    },
    'hafg3jk2': {
      'de': '0',
      'en': '0',
    },
    'k6ksti1g': {
      'de': 'Zutat hinzufügen',
      'en': 'Add ingredient',
    },
    'dbkmaeu5': {
      'de': 'Zutatenübersicht:',
      'en': 'Ingredients overview:',
    },
    '7d1zkgpq': {
      'de': 'Total CO2e dieser Mahlzeit:',
      'en': 'Total CO2e of this meal:',
    },
    'c57a2iwf': {
      'de': 'kg',
      'en': 'kg',
    },
    'xmr5c6fs': {
      'de': 'Mahlzeit speichern',
      'en': 'Save meal',
    },
    '4b1thaap': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // MahlzeitBearbeiten
  {
    'bynaq2cy': {
      'de': 'Mahlzeit bearbeiten',
      'en': 'Edit meal',
    },
    'ooxxzhk3': {
      'de': 'TextField',
      'en': 'TextField',
    },
    '7g7ekovr': {
      'de': 'Option 1',
      'en': 'Option 1',
    },
    '1cjf5zha': {
      'de': 'Option 2',
      'en': 'Option 2',
    },
    '8z1x9exk': {
      'de': 'Option 3',
      'en': 'Option 3',
    },
    '7ajahq9d': {
      'de': 'Zutat auswählen..',
      'en': 'Select ingredient...',
    },
    '77v60pq0': {
      'de': 'Zutat suchen...',
      'en': 'Search ingredient...',
    },
    'vx3dohe8': {
      'de': '0',
      'en': '0',
    },
    'tuypz1ia': {
      'de': 'Zutat hinzufügen',
      'en': 'Add ingredient',
    },
    'b75i9fyr': {
      'de': 'Zutatenübersicht:',
      'en': 'Ingredients overview:',
    },
    'x2wqautk': {
      'de': 'Total CO2e dieser Mahlzeit:',
      'en': 'Total CO2e of this meal:',
    },
    'ixjbblyc': {
      'de': 'kg',
      'en': 'kg',
    },
    'fejdy3zb': {
      'de': 'Mahlzeit speichern',
      'en': 'Save meal',
    },
    '0ebztxwf': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // WohnenBearbeiten
  {
    'qodul6eh': {
      'de': 'Wohnen',
      'en': 'Housing',
    },
    'gnu07rou': {
      'de': 'Energie',
      'en': 'Energy',
    },
    '28nqk608': {
      'de': 'Konsum',
      'en': 'Consumption',
    },
    'hzkils3g': {
      'de': 'Wohnen',
      'en': 'Housing',
    },
    'aw8paz6k': {
      'de': 'In welchem Typ Haus wohnst du?',
      'en': 'What type of house do you live in?',
    },
    '60697aer': {
      'de': 'Einfamilienhaus',
      'en': 'Single-family home',
    },
    's33niv2d': {
      'de': 'Mehrfamilienhaus',
      'en': 'Apartment building',
    },
    'nie4hjfa': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'i609jams': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'et410v4y': {
      'de': 'Wie heizt du dein Zuhause?',
      'en': 'How do you heat your home?',
    },
    'w8a4aw87': {
      'de': 'Ölheizung',
      'en': 'Oil heating',
    },
    'v26lbr2q': {
      'de': 'Ölheizung mit Solarpanels',
      'en': 'Oil heating with solar panels',
    },
    '9fti01qe': {
      'de': 'Gasheizung',
      'en': 'Gas heating',
    },
    'pv4vmrbb': {
      'de': 'Gasheizung mit Solarpanels',
      'en': 'Gas heating with solar panels',
    },
    '2mye6630': {
      'de': 'Fernwärme',
      'en': 'District heating',
    },
    '2jsw3oxi': {
      'de': 'Elektroheizung',
      'en': 'Electric heating',
    },
    'xt2fecv0': {
      'de': 'Wärmepumpe',
      'en': 'Heat pump',
    },
    'xpficm4c': {
      'de': 'Holz mit Solarpanels',
      'en': 'Wood with solar panels',
    },
    '1nu4tieq': {
      'de': 'Holz (Pellets, Scheite)',
      'en': 'Wood (pellets, logs)',
    },
    '30u4e7sn': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'ffjudffs': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '8up4azm6': {
      'de': 'Baujahr oder Minergie-Standard',
      'en': 'Year of construction or Minergie standard',
    },
    'clqn34zf': {
      'de': 'Vor 1980',
      'en': 'Before 1980',
    },
    '6x3uithv': {
      'de': '1980 - 1990',
      'en': '1980 - 1990',
    },
    '036ylzs6': {
      'de': '1991 - 2008',
      'en': '1991 - 2008',
    },
    '3pkdss50': {
      'de': 'Nach 1980',
      'en': 'After 1980',
    },
    'zrmyzffy': {
      'de': 'Minergie',
      'en': 'Minergie',
    },
    'iitxgedr': {
      'de': 'Minergie-A',
      'en': 'Minergie-A',
    },
    '7793q73l': {
      'de': 'Minergie-P',
      'en': 'Minergie-P',
    },
    '6n5olkas': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'r3d1is6c': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '9vgqoecu': {
      'de': 'Durchschnittliche Raumtemperatur',
      'en': 'Average room temperature',
    },
    'bsy7upwt': {
      'de': '<= 17 °C',
      'en': '<= 17 °C',
    },
    'or8lh8sq': {
      'de': '18 - 19 °C',
      'en': '18 - 19 °C',
    },
    '6pvynl8e': {
      'de': '20 - 22 °C',
      'en': '20 - 22 °C',
    },
    'b660m23o': {
      'de': '> 22 °C',
      'en': '> 22 °C',
    },
    '3fc4s77g': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '39zaxpzk': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'r9kts1mi': {
      'de': 'Beheizte Fläche',
      'en': 'Heated area',
    },
    'lv6qihmh': {
      'de': '> 30 m2',
      'en': '> 30 m2',
    },
    'tlxom7j7': {
      'de': '30 - 50 m2',
      'en': '30 - 50 m2',
    },
    'b5r2pa2g': {
      'de': '51 - 75 m2',
      'en': '51 - 75 m2',
    },
    'tli6oi6h': {
      'de': '76 - 100 m2',
      'en': '76 - 100 m2',
    },
    '2z04v7q7': {
      'de': '101 - 125 m2',
      'en': '101 - 125 m2',
    },
    'uwf8nrb5': {
      'de': '126 - 150 m2',
      'en': '126 - 150 m2',
    },
    'eyhj3n3f': {
      'de': '151 - 200 m2',
      'en': '151 - 200 m2',
    },
    'l1nwdzx1': {
      'de': '201 - 300 m2',
      'en': '201 - 300 m2',
    },
    'g39tawet': {
      'de': '> 300 m2',
      'en': '> 300 m2',
    },
    'onvhk8be': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'ck7g1gn9': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'ksdyyas3': {
      'de': 'Wie viele Personen wohnen in deinem Haushalt?',
      'en': 'How many people live in your household?',
    },
    'v5ottzle': {
      'de': '1',
      'en': '1',
    },
    'njmjj41x': {
      'de': '2',
      'en': '2',
    },
    'ho1xu5en': {
      'de': '3',
      'en': '3',
    },
    'e9oy1tj2': {
      'de': '4',
      'en': '4',
    },
    'vvm2wesy': {
      'de': '5',
      'en': '5',
    },
    'g9w6nhin': {
      'de': '6',
      'en': '6',
    },
    'r5f0xgw1': {
      'de': '7 (oder mehr)',
      'en': '7 (or more)',
    },
    'mtqesr6p': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'czu7e2ik': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '9ibfs9k8': {
      'de': 'Wie wird dein Wasser geheizt?',
      'en': 'How is your water heated?',
    },
    'dl8caxmz': {
      'de': 'Ölheizung',
      'en': 'Oil heating',
    },
    'ahqn2ymg': {
      'de': 'Ölheizung mit Solarpanels',
      'en': 'Oil heating with solar panels',
    },
    'l06z4c4b': {
      'de': 'Gasheizung',
      'en': 'Gas heating',
    },
    '5au3z11t': {
      'de': 'Gasheizung mit Solarpanels',
      'en': 'Gas heating with solar panels',
    },
    'h77h1drn': {
      'de': 'Fernwärme',
      'en': 'District heating',
    },
    'askk23f8': {
      'de': 'Elektroheizung',
      'en': 'Electric heating',
    },
    'jn2eywha': {
      'de': 'Wärmepumpe',
      'en': 'Heat pump',
    },
    '5sfd5d0y': {
      'de': 'Holz mit Solarpanels',
      'en': 'Wood with solar panels',
    },
    're36e7v2': {
      'de': 'Holz (Pellets, Scheite)',
      'en': 'Wood (pellets, logs)',
    },
    'xwg0vh0o': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'wpznbyyk': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'tzim5rkt': {
      'de':
          'Welche (durchschnittliche) Energieeffizienz haben deine Elektrogeräte?',
      'en':
          'What (average) energy efficiency do your electrical appliances have?',
    },
    'zt2zmlcc': {
      'de': 'Schlechter als A',
      'en': 'Worse than A',
    },
    'h6prmtjm': {
      'de': 'A',
      'en': 'A',
    },
    'urqvnryj': {
      'de': 'A+',
      'en': 'A+',
    },
    'qpuj1z1p': {
      'de': 'A++',
      'en': 'A++',
    },
    'ovwnl24h': {
      'de': 'Keine Ahnung - die meisten Geräte sind älter als 10 Jahre',
      'en': 'No idea - most devices are older than 10 years',
    },
    'ukn3i1sq': {
      'de': 'Keine Ahnung - die meisten Geräte sind neuer als 10 Jahre',
      'en': 'No idea - most devices are newer than 10 years',
    },
    'l6q90jy8': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'ibzjipyd': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '9bdmi9jt': {
      'de': 'Welche Kühlgeräte nutzt  du?',
      'en': 'Which refrigerators do you use?',
    },
    'vdqq4j6y': {
      'de': 'Kühlschrank mit Gefrierfach',
      'en': 'Refrigerator with freezer compartment',
    },
    'v9b3gdcy': {
      'de': 'Kühlschrank/Tiefkühlerkombination (zweitürig) ',
      'en': 'Refrigerator/freezer combination (two-door)',
    },
    '29bgaktc': {
      'de': 'Kühlschrank mit Gefierfach und Tiefkühltruhe',
      'en': 'Refrigerator with freezer compartment and freezer',
    },
    'caa2gnno': {
      'de': 'Mehrere Kühlschränke und/oder Gefriertruhen',
      'en': 'Multiple refrigerators and/or freezers',
    },
    'gick2gkw': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'bmjb8yjj': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '0q34d839': {
      'de': 'Wie wäschst du deine Wäsche?',
      'en': 'How do you wash your clothes?',
    },
    'ro10vtup': {
      'de': 'Über die Hälfte 30 °C und weniger, selten 60 °C ',
      'en': 'More than half 30 °C and less, rarely 60 °C',
    },
    'elou24n6': {
      'de': 'Den grössten Teil 40 °C, ca. 1/3 60 °C, keine Kochwäsche (95 °C)',
      'en': 'Most of it 40 °C, approx. 1/3 60 °C, no boiling (95 °C)',
    },
    'xl9q5l4v': {
      'de': 'Gemäss Herstellerangabe, gelegentlich Kochwäsche (95 °C)',
      'en':
          'According to manufacturer\'s instructions, occasional boil wash (95 °C)',
    },
    'nsdnbnlh': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'qib9jahx': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '5z7sqmdm': {
      'de': 'Wie trocknest du deine Wäsche?',
      'en': 'How do you dry your laundry?',
    },
    'd7uys7q6': {
      'de': 'Wäscheleine',
      'en': 'clothesline',
    },
    'vj3xwq7c': {
      'de': 'Teils im Tumbler / teils an der Wäscheleine',
      'en': 'Partly in the tumble dryer / partly on the clothesline',
    },
    'ihy4xsrs': {
      'de': 'Nur im Tumbler',
      'en': 'Only in the tumble dryer',
    },
    'alm1ihg8': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'fyg4d583': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'gmlh6wr2': {
      'de':
          'Welcher Anteil deines Stroms läuft unter dem Label \"naturemade Star\"?',
      'en':
          'What proportion of your electricity comes under the “naturemade Star” label?',
    },
    'w8es0bho': {
      'de': 'Kein Anteil',
      'en': 'No share',
    },
    'rijozni0': {
      'de': 'Ein Teil davon',
      'en': 'Part of it',
    },
    'kak476xt': {
      'de': 'Alles',
      'en': 'Everything',
    },
    'h4motw7u': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'iwybr7v6': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'ip51ualp': {
      'de': 'Wie hoch sind deine monatlichen Ausgaben für...',
      'en': 'How much money do you spend monthly on...',
    },
    'bn7ggdbb': {
      'de': 'Schuhe und Kleidung?',
      'en': 'Shoes and clothes?',
    },
    'ktr8go8d': {
      'de': 'Sehr tief (ca. 20 CHF oder weniger)',
      'en': 'Very low (approx. 20 CHF or less)',
    },
    'env5v31p': {
      'de': 'Tief (ca. 50 CHF)',
      'en': 'Low (approx. 50 CHF)',
    },
    'jdm4fgzu': {
      'de': 'Durchschnitt (ca. 100 CHF)',
      'en': 'Average (approx. 100 CHF)',
    },
    'qu3dh0wt': {
      'de': 'Hoch (ca. 125 CHF)',
      'en': 'High (approx. 125 CHF)',
    },
    'q1xczzm2': {
      'de': 'Sehr hoch (ca. 250 CHF oder mehr)',
      'en': 'Very high (approx. 250 CHF or more)',
    },
    'tb7ru4md': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '6l4is0lk': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'gqsh9nwg': {
      'de': 'Hobbies, Freizeitaktivitäten und Haustiere?',
      'en': 'Hobbies, leisure activities and pets?',
    },
    'btcy3h8k': {
      'de': 'Sehr tief (50 CHF oder weniger)',
      'en': 'Very low (50 CHF or less)',
    },
    'nm0qaup6': {
      'de': 'Tief (ca. 150 CHF)',
      'en': 'Low (approx. 150 CHF)',
    },
    'l58mv59b': {
      'de': 'Durchschnitt (ca. 260 CHF)',
      'en': 'Average (approx. 260 CHF)',
    },
    'o3lqbni8': {
      'de': 'Hoch (ca. 400 CHF)',
      'en': 'High (approx. 400 CHF)',
    },
    '5i2y5inm': {
      'de': 'Sehr hoch (ca. 600 CHF oder mehr)',
      'en': 'Very high (approx. 600 CHF or more)',
    },
    'v2t08tgj': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '915vzbo5': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '2vd1vzy3': {
      'de': 'Möbel und Haushaltsgeräte?',
      'en': 'Furniture and household appliances?',
    },
    'xsdif0pr': {
      'de': 'Sehr tief (25 CHF oder weniger)',
      'en': 'Very low (25 CHF or less)',
    },
    'ta5brzr1': {
      'de': 'Tief (ca. 75 CHF)',
      'en': 'Low (approx. 75 CHF)',
    },
    'iyufkpuo': {
      'de': 'Durchschnitt (ca. 125 CHF)',
      'en': 'Average (approx. 125 CHF)',
    },
    '6oxi5pcb': {
      'de': 'Hoch (ca. 200 CHF)',
      'en': 'High (approx. 200 CHF)',
    },
    'dswl1puh': {
      'de': 'Sehr hoch (ca. 300 CHF oder mehr)',
      'en': 'Very high (approx. 300 CHF or more)',
    },
    'vypx4aky': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    '2k3jt3cp': {
      'de': 'Search...',
      'en': 'Search...',
    },
    'bdro2mvu': {
      'de': 'Auswertige Verpflegung?',
      'en': 'Food from outside?',
    },
    'c304rida': {
      'de': 'Sehr tief (50 CHF oder weniger)',
      'en': 'Very low (50 CHF or less)',
    },
    '8l0jd8bm': {
      'de': 'Tief (ca. 100 CHF)',
      'en': 'Low (approx. 100 CHF)',
    },
    'zvy1faue': {
      'de': 'Durchschnitt (ca. 250 CHF)',
      'en': 'Average (approx. 250 CHF)',
    },
    'y7yb56aw': {
      'de': 'Hoch (ca. 400 CHF)',
      'en': 'High (approx. 400 CHF)',
    },
    'liw8aq00': {
      'de': 'Sehr hoch (ca. 600 CHF oder mehr)',
      'en': 'Very high (approx. 600 CHF or more)',
    },
    'hec30axn': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'hu45rxj1': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '46houobh': {
      'de':
          'Welcher Anteil deiner Ersparnisse/Vorsorge ist nachhaltig angelegt?',
      'en':
          'What proportion of your savings/provisions are invested sustainably?',
    },
    'werzsu60': {
      'de': 'Kein Anteil',
      'en': 'No share',
    },
    'cyqele2v': {
      'de': 'Wenig',
      'en': 'Few',
    },
    'btgbk52n': {
      'de': 'Viel',
      'en': 'Much',
    },
    'x92a37wm': {
      'de': 'Alles',
      'en': 'Everything',
    },
    '1qq31j1q': {
      'de': 'Keine Ahnung',
      'en': 'No idea',
    },
    'fgtcvbws': {
      'de': 'Bitte auswählen',
      'en': 'Please select',
    },
    'zm2u7kue': {
      'de': 'Search...',
      'en': 'Search...',
    },
    '2teo2fl5': {
      'de': 'Anpassungen speichern',
      'en': '',
    },
    'hk1qm9c6': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // ProfilResetOption
  {
    '2zh7t583': {
      'de': 'Profil',
      'en': 'Profile',
    },
    'cm44jisd': {
      'de': 'Username',
      'en': 'Username',
    },
    'zs1cmk8u': {
      'de': 'Einstellungen zurücksetzen',
      'en': 'Reset options',
    },
    '3k81gbaw': {
      'de': 'Name: ',
      'en': 'Name:',
    },
    '7u5vy5vx': {
      'de': 'Start Periode:',
      'en': 'Start Period:',
    },
    '65dlmzsm': {
      'de': 'Ende Periode: ',
      'en': 'End Period: ',
    },
    'fvwvm49c': {
      'de': 'App State zurücksetzen',
      'en': 'Reset App State',
    },
    'ow53mv70': {
      'de': 'Profil',
      'en': 'Profile',
    },
  },
  // ProfilDatenschutz
  {
    '7h2fwxl6': {
      'de': 'Profil',
      'en': 'Profile',
    },
    'j5f387va': {
      'de': 'Username',
      'en': 'Username',
    },
    'xaawf6q1': {
      'de':
          'Informationen über den Schutz und die Verarbeitung personenbezogener Daten',
      'en': 'Information on the protection and processing of personal data',
    },
    '6hk81y33': {
      'de': 'Name: ',
      'en': 'Name: ',
    },
    'vpvjn5ga': {
      'de': 'Start Periode:',
      'en': 'Start Period:',
    },
    '3bispke2': {
      'de': 'Ende Periode: ',
      'en': 'End Period: ',
    },
    'luhkxkdh': {
      'de':
          'Sobald diese Anwendung im produktiven Umfeld verwendet wird (bspw. Google Play Store), müssen Angaben rund um die Verarbeitung personenbezogener Daten gemacht und dem User zur Verfügung gestellt werden. Diese beinhalten unter anderem:\n\n- Name/Kontaktdaten der zuständigen Person\n- Zweck der Datenverarbeitung\n- Art der verarbeiteten Daten (welche Daten werden erhoben?)\n- Datenspeicherung (Wo und wie lange werden die Daten gespeichert?)\n- Weitere',
      'en':
          'As soon as this application is used in a productive environment (e.g. Google Play Store), information about the processing of personal data must be provided and made available to the user. This includes, among other things\n\n- Name/contact details of the person responsible\n- Purpose of the data processing\n- Type of data processed (what data is collected?)\n- Data storage (where and for how long is the data stored?)\n- Further',
    },
    'uj9l5sq0': {
      'de': 'Profil',
      'en': 'Profile',
    },
  },
  // ProfilLoeschen
  {
    '9kb1wpf8': {
      'de': 'Profil',
      'en': 'Profile',
    },
    'o701y3yx': {
      'de': 'Username',
      'en': 'Username',
    },
    'gzzfgypm': {
      'de': 'Account löschen',
      'en': 'Delete account',
    },
    'z3ll0e3x': {
      'de': 'Name: ',
      'en': 'Name: ',
    },
    'dmeilqrv': {
      'de': 'Start Periode:',
      'en': 'Start Period:',
    },
    'okneso1z': {
      'de': 'Ende Periode: ',
      'en': 'End Period: ',
    },
    'y8ihk9ye': {
      'de':
          'Sobald diese Anwendung im produktiven Umfeld verwendet wird (bspw. Google Play Store), muss der User die Möglichkeit haben, sein Konto und sämtliche damit verbundenen Daten zu löschen.\n\nDie Funktion muss nicht zwingend innerhalb der App vorhanden sein, aus Sicht Usability macht es aber Sinn, damit der User sich nicht schriftlich melden und die Löschung seiner Daten beantragen muss. ',
      'en':
          'As soon as this application is used in a productive environment (e.g. Google Play Store), the user must have the option of deleting their account and all associated data.\n\nThe function does not necessarily have to be available within the app, but from a usability perspective it makes sense so that the user does not have to write to request the deletion of their data. ',
    },
    'rybrpyq9': {
      'de': 'Profil',
      'en': 'Profile',
    },
  },
  // UsernameEmail
  {
    '2nlh9k42': {
      'de': 'E-Mail',
      'en': 'E-Mail',
    },
    'x6trc2ef': {
      'de': 'max.muster@gmail.com',
      'en': 'max.muster@gmail.com',
    },
  },
  // Password
  {
    '2fuk5efi': {
      'de': 'Passwort',
      'en': 'Password',
    },
    'wpeyodp7': {
      'de': '********************',
      'en': '********************',
    },
  },
  // ZutatenDropdown
  {
    '0ws5cs5k': {
      'de': 'Option 1',
      'en': 'Option 1',
    },
    'cjvsc2tt': {
      'de': 'Option 2',
      'en': 'Option 2',
    },
    'wcf40fr1': {
      'de': 'Option 3',
      'en': 'Option 3',
    },
    't605a8le': {
      'de': 'Zutaten auswählen...',
      'en': 'Select ingredients...',
    },
    '5xfmxku9': {
      'de': 'Search...',
      'en': 'Search...',
    },
  },
  // MenuZusammenstellung
  {
    'j0hu4xuz': {
      'de': '0',
      'en': '0',
    },
  },
  // ZutatenAuswahlliste
  {
    'y9vizgj0': {
      'de': 'Option 1',
      'en': 'Option 1',
    },
    'uuh00pf8': {
      'de': 'Option 2',
      'en': 'Option 2',
    },
    '29cvmzgr': {
      'de': 'Option 3',
      'en': 'Option 3',
    },
    'o7sw77yk': {
      'de': 'Zutaten auswählen...',
      'en': 'Select ingredients...',
    },
    'vp9zjalg': {
      'de': 'Suchen...',
      'en': 'Search...',
    },
  },
  // zutatenListeMenge
  {
    'j8mcvtut': {
      'de': '',
      'en': '',
    },
    'e67hdowf': {
      'de': '0',
      'en': '0',
    },
  },
  // EmptyWidgetPlaceholder
  {
    'zl9a5x8f': {
      'de': 'Keine Einträge vorhanden',
      'en': 'No entries available',
    },
  },
  // MahlzeitenMsg
  {
    'd0wf158h': {
      'de':
          'Du hast noch keine Mahlzeiten erfasst. Füge jetzt deine erste Mahlzeit hinzu 😊',
      'en': 'You have not yet entered any meals. Add your first meal now 😊',
    },
  },
  // DashboardBottomSheet
  {
    'lompet3b': {
      'de': 'Total CO2e nach Item',
      'en': 'Total CO2e per Item',
    },
    'l2z1q299': {
      'de': 'kg',
      'en': 'kg',
    },
    '1tokl1s9': {
      'de': 'kg',
      'en': 'kg',
    },
  },
  // Miscellaneous
  {
    '07n9kgdq': {
      'de': 'Fehler: [Error]',
      'en': 'Error: [Error]',
    },
    '84iesjwx': {
      'de': '',
      'en': '',
    },
    'ts0wkebu': {
      'de': '',
      'en': '',
    },
    'tmtxemup': {
      'de': '',
      'en': '',
    },
    'ywiu604f': {
      'de': '',
      'en': '',
    },
    'kbq6neas': {
      'de': '',
      'en': '',
    },
    'c2cb3v5b': {
      'de': '',
      'en': '',
    },
    '0jaan6b9': {
      'de': '',
      'en': '',
    },
    'arhyv3ed': {
      'de': '',
      'en': '',
    },
    'p4pckl8u': {
      'de': '',
      'en': '',
    },
    'q2xbsx4g': {
      'de':
          'Die eingegebenen Authentifizierungsdaten sind falsch oder abgelaufen',
      'en':
          'The supplied auth credential is incorrect, malformed or has expired',
    },
    '5i11mrpe': {
      'de': '',
      'en': '',
    },
    'hokgrta3': {
      'de': '',
      'en': '',
    },
    's04ugvs2': {
      'de': '',
      'en': '',
    },
    'blkw56r6': {
      'de': '',
      'en': '',
    },
    'a4nsjf5f': {
      'de': '',
      'en': '',
    },
    'pmjti7lc': {
      'de': '',
      'en': '',
    },
    'oqq94bbh': {
      'de': '',
      'en': '',
    },
    '2c7gp8tp': {
      'de': '',
      'en': '',
    },
    '0j51d93b': {
      'de': '',
      'en': '',
    },
    'pagv3ekx': {
      'de': '',
      'en': '',
    },
    'qr0tksk6': {
      'de': '',
      'en': '',
    },
    '15b9ml3j': {
      'de': '',
      'en': '',
    },
    '797ewopj': {
      'de': '',
      'en': '',
    },
    '3ui1j3w1': {
      'de': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
