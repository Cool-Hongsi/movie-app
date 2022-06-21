// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIConst {
  // BASE
  static var API_ADDRESS = dotenv.env['OMDB_API_ADDRESS'];
  static var API_KEY = dotenv.env['OMDB_API_KEY'];

  // SEARCH BY TITLE
  static const SEARCH_BY_TITLE = "s";
}
